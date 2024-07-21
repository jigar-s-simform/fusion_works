import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion_works/services/bot_toast_service.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

import '../model/pagination_model.dart';
import '../values/strings.dart';
import 'enumeration.dart';

part 'pagination_store.g.dart';

class PaginationStore<T> = _PaginationStore<T> with _$PaginationStore<T>;

abstract class _PaginationStore<T> with Store {
  int? lastPageKey;

  @observable
  PagingController<int, T> pagingController = PagingController(
    firstPageKey: firstPageKeyForPagination,
  );

  static const int firstPageKeyForPagination = 1;

  @observable
  NetworkState pagingNetworkState = NetworkState.idle;

  @observable
  CancelableOperation<PaginationModel<T>>? apiCallOp;

  @observable
  bool isPagingListEmpty = true;

  @computed
  bool get isPagingListNotEmpty => !isPagingListEmpty;

  @observable
  PagingStatus pagingStatus = PagingStatus.loadingFirstPage;

  void addPagingListener(ValueChanged<int> listener) {
    pagingController
      ..addPageRequestListener(listener)
      ..addStatusListener(
        (status) {
          pagingStatus = status;
          if (status.isLoadingFirstPage) {
            lastPageKey = null;
          }

          if (status.isSubsequentPageError) {
            BotToastService.showSnack(AppStrings.oopsSomethingWentWrong);
          }
        },
      )
      ..addListener(
        () => isPagingListEmpty = pagingController.itemList == null ||
            (pagingController.itemList?.isEmpty ?? true),
      );
  }

  Future<void> paginationHandler({
    required int pageKey,
    required AsyncValueGetter<PaginationModel<T>> callAPI,
    String? errorMessage,
    bool searchCondition = true,
    AsyncValueGetter? onSuccess,
  }) async {
    ///If the lastPageKey is null that probably means it's a fresh call.
    ///So we will assign whatever value pageKey has to lastPageKey.
    lastPageKey ??= pageKey;
    if (!searchCondition) {
      pagingNetworkState = NetworkState.idle;
      pagingController.itemList = <T>[];
      return;
    }
    pagingNetworkState = NetworkState.loading;
    try {
      ///Initially the page will be 1 and it will be incremented everytime.
      apiCallOp = CancelableOperation.fromFuture(
        callAPI.call(),
        onCancel: () {
          pagingController.error = '';
          pagingNetworkState = NetworkState.error;
          pagingController.itemList?.clear();
        },
      );

      final results = await apiCallOp?.value;

      if (results != null) {
        ///Check if we have reached last page or not. Add length of list in UI &
        ///the list which we got from API and if that length is greater than
        ///totalCount then it means we already consumed last page.
        final isLastPage =
            (pagingController.itemList?.length ?? 0) + results.list.length >=
                results.totalCount;
        if (pageKey == firstPageKeyForPagination) {
          pagingController.itemList?.clear();
        }
        if (isLastPage) {
          ///If it is last page use the appendLastPage to mark there will be no
          ///more pagination.
          pagingController.appendLastPage(results.list);
        } else {
          ///If there are more pages, then increment the pageKey by 1.
          ///So next page key will be like 2,3,4...
          ///Pass the same to appendPage() so next time whenever
          ///addPageRequestListener() will be called,
          ///it will give the incremented page.
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(
            results.list,
            nextPageKey,
          );
        }

        ///Again set the lastPageKey to our current fetched pageKey so that
        ///last page can be also updated.
        lastPageKey = pageKey;
        await onSuccess?.call();
      }
      pagingNetworkState = NetworkState.success;
    } catch (e, s) {
      pagingNetworkState = NetworkState.error;
      pagingController.error = e.toString();
      BotToastService.showSnack(AppStrings.oopsSomethingWentWrong);
    }
  }

  Future<void> refreshPagination() async {
    await apiCallOp?.cancel();
    pagingController.refresh();
  }
}
