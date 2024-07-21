import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../apibase/repository.dart';
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
          padding: const EdgeInsets.all(16),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.inputBorder),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      cursorHeight: 20,
                      style: const TextStyle(
                        color: AppColors.black,
                      ),
                      decoration: const InputDecoration(
                        hintText: Constants.messageBubblePrompt,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.mediumGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: GestureDetector(
                    onTap: _submitMessage,
                    child: Image.asset(
                      fit: BoxFit.fitHeight,
                      Assets.images.sendButton.path,
                      width: 36,
                      height: 36,
                    ),
                  ),
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
    if (text.trim().isNotEmpty) {
      context.read<ChatStore>().addMessage(text, false);
      context.read<ChatStore>().receiveMessageFromAssistant();
      _textController.clear();

      final response = context.read<ChatStore>().isDatabaseSelected
          ? (await Repository.chatDb.getModelResponse(text)).data?.response
          : await Repository.instance.getDocsModelResponse(text);
      context
          .read<ChatStore>()
          .editLastMessageWithContent(response ?? 'Something went wrong');
    }
  }
}
