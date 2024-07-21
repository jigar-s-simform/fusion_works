import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fusion_works/gen/assets.gen.dart';
import 'package:fusion_works/model/response/feed_status/status_res_dm.dart';
import 'package:fusion_works/modules/feed_screen/feed_store.dart';
import 'package:fusion_works/utils/enumeration.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:fusion_works/values/strings.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<FeedScreenStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Assets.icons.sort.svg(),
          ),
          InkWell(
            onTap: () => context.pushNamed<void>(AppRoutes.addStatus),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Assets.icons.add.svg(),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: store.getDsuList,
            child: Skeletonizer(
              enabled: store.statusListState.isLoading,
              child: store.dsuList.isEmpty && !store.statusListState.isLoading
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.35,
                        ),
                        const Text(
                          'No Status Posted Yet!',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: store.statusListState.isLoading
                          ? StatusResDm.fake.length
                          : store.dsuList.length,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        final status = store.statusListState.isLoading
                            ? StatusResDm.fake[index]
                            : store.dsuList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: '${status.user?.fullName} posted in ',
                                    children: [
                                      TextSpan(
                                        text: '${status.project?.title ?? ''}.',
                                        style: context.textTheme.titleLarge
                                            ?.copyWith(fontSize: 14),
                                      ),
                                    ],
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                status.postDate?.formatForStatusDm() ?? '',
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
