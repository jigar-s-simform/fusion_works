import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../values/app_colors.dart';
import '../../values/constants.dart';
import 'chat_store.dart';
import 'widgets/chat_list.dart';

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
  final Map<int, Widget> chatWidgets = const <int, Widget>{
    0: ChatList(),
    1: ChatList(),
  };

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
        centerTitle: false,
        leadingWidth: 32,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text(
          Constants.chatLabel,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.read<ChatStore>().clearChats(),
            child: const Text(
              Constants.clear,
              style: TextStyle(color: AppColors.red),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Observer(
              builder: (_) => Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.lightGrey,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: chatStore.isDatabaseSelected
                              ? AppColors.buttonSelectedBackground
                              : AppColors.white,
                        ),
                        width: 167.5,
                        height: 40,
                        child: Text(
                          Constants.database,
                          style: TextStyle(
                            color: chatStore.isDatabaseSelected
                                ? AppColors.colorPrimary
                                : AppColors.mediumGrey,
                            fontWeight: chatStore.isDatabaseSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      onTap: () =>
                          context.read<ChatStore>().setIsDatabaseSelected(true),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<ChatStore>()
                          .setIsDatabaseSelected(false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: !chatStore.isDatabaseSelected
                              ? AppColors.buttonSelectedBackground
                              : AppColors.white,
                        ),
                        width: 167.5,
                        height: 40,
                        child: Text(
                          Constants.documents,
                          style: TextStyle(
                            color: !chatStore.isDatabaseSelected
                                ? AppColors.colorPrimary
                                : AppColors.mediumGrey,
                            fontWeight: !chatStore.isDatabaseSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: ChatList(),
            ),
          ],
        ),
      ),
    );
  }
}
