import 'package:flutter/material.dart';
import 'package:fusion_works/apibase/repository.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../../values/app_colors.dart';
import '../../../values/constants.dart';
import '../chat_store.dart';

/// Set of widget that contains TextField and Button to submit message
class MessageBar extends StatefulWidget {
  const MessageBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageBar> createState() => MessageBarState();
}

class MessageBarState extends State<MessageBar> {
  late final TextEditingController _textController;

  @override
  void didUpdateWidget(covariant MessageBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final chatStore = Provider.of<ChatStore>(context);
    return Material(
      color: AppColors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.hintTextColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: chatStore.scrollController,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 5,
                      controller: _textController,
                      cursorColor: AppColors.black,
                      style: const TextStyle(
                        color: AppColors.black,
                      ),
                      decoration: const InputDecoration(
                        hintText: Constants.startConversationNow,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                        hintStyle: TextStyle(
                          color: AppColors.hintTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _submitMessage,
                  child: Image.asset(Assets.images.sendButton.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final text = _textController.text;
    context.read<ChatStore>().addMessage(text, false);
    context.read<ChatStore>().receiveMessageFromAssistant();
    _textController.clear();
    final response = await Repository.chatDb.getModelResponse(text);
    context
        .read<ChatStore>()
        .editLastMessageWithContent(response.data?.response ?? '');
  }
}
