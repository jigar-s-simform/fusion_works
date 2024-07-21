import 'package:fusion_works/model/request/dsu_list_req_dm.dart';
import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/feed_status/status_res_dm.dart';
import '../../utils/enumeration.dart';

part 'feed_store.g.dart';

class FeedScreenStore = _FeedScreenStore with _$FeedScreenStore;

abstract class _FeedScreenStore with Store {
  @observable
  NetworkState statusListState = NetworkState.idle;

  @observable
  List<StatusResDm> dsuList = [];

  @action
  Future<void> getDsuList() async {
    statusListState = NetworkState.loading;
    try {
      final res = await Repository.instance.getDsuList(const DsuListReqDm());
      dsuList = res.dsu ?? <StatusResDm>[];
      statusListState = NetworkState.success;
    } catch (e) {
      statusListState = NetworkState.error;
    }
  }
}
