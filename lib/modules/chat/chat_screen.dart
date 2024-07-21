import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../values/app_colors.dart';
import '../../values/constants.dart';
import 'chat_store.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isSearchBoxVisible = false;
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ChatStore>().addMessage(Constants.firstMessage, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatStore = Provider.of<ChatStore>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: isSearchBoxVisible ? 100 : 50,
        title: isSearchBoxVisible
            ? TextFormField(
                keyboardType: TextInputType.text,
                maxLines: null,
                autofocus: true,
                controller: _searchController,
                cursorColor: AppColors.white,
                style: const TextStyle(
                  color: AppColors.white,
                ),
                decoration: const InputDecoration(
                  hintText: Constants.hintText,
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              )
            : const Text(
                Constants.chatLabel,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.clear : Icons.search,
              color: AppColors.white,
            ),
            onPressed: () {
              setState(() {
                _searchController.clear();
                isSearching = !isSearching;
                isSearchBoxVisible = !isSearchBoxVisible;
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Stack(
          children: [
            Column(
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
                                  scrollNotification.metrics.extentBefore <
                                      10) {}
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
                                    isLoading: index ==
                                            chatStore.messages.length - 1 &&
                                        chatStore.isResponseLoading &&
                                        chatStore
                                            .messages[
                                                chatStore.messages.length - 1]
                                            .isAssistant,
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                ),
                const MessageBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
