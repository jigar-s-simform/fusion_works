import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../values/app_colors.dart';
import '../../../values/constants.dart';
import '../chat_store.dart';
import 'chat_bubble.dart';
import 'message_bubble.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    final chatStore = Provider.of<ChatStore>(context);

    return Column(
      children: [
        Observer(
          builder: (_) => Expanded(
            child: chatStore.messages.isEmpty
                ? const Center(
                    child: Text(
                      Constants.startConversationNow,
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  )
                : NotificationListener<UserScrollNotification>(
                    onNotification:
                        (UserScrollNotification scrollNotification) {
                      if (scrollNotification.direction ==
                              ScrollDirection.forward &&
                          scrollNotification.metrics.extentBefore < 10) {}
                      return false;
                    },
                    child: Scrollbar(
                      thickness: 8,
                      radius: const Radius.circular(8),
                      controller: chatStore.scrollController,
                      trackVisibility: true,
                      child: ListView.builder(
                        controller: chatStore.scrollController,
                        itemCount: chatStore.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatStore.messages[index];
                          return ChatBubble(
                            message: message,
                            index: index,
                            isLoading: index == chatStore.messages.length - 1 &&
                                chatStore.isResponseLoading &&
                                chatStore
                                    .messages[chatStore.messages.length - 1]
                                    .isAssistant,
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.12),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, -4), // changes position of shadow
              ),
            ],
          ),
          child: MessageBar(),
        ),
      ],
    );
  }
}
