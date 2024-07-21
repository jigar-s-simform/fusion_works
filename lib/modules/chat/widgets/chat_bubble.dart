import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../../model/message.dart';
import '../chat_store.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble({
    Key? key,
    required this.message,
    required this.index,
    required this.isLoading,
  }) : super(key: key);

  final Message message;
  final int index;
  bool isLoading;

  @override
  State<ChatBubble> createState() => ChatBubbleState();
}

class ChatBubbleState extends State<ChatBubble> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChatBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final chatStore = Provider.of<ChatStore>(context);

    final chatContents = [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.asset(
          widget.message.isAssistant
              ? Assets.images.bot.path
              : Assets.images.profileImage.path,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Observer(
          builder: (_) => Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: widget.index == chatStore.messages.length - 1 &&
                    chatStore.isResponseLoading
                ? Lottie.asset(Assets.textLoader)
                : Text(
                    widget.message.content ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: widget.message.isAssistant
                          ? FontWeight.w400
                          : FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
      const SizedBox(width: 12),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: chatContents,
      ),
    );
  }
}
