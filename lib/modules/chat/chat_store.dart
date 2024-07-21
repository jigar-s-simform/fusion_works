import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../model/message.dart';
import '../../values/constants.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  @observable
  ObservableList<Message> messages = ObservableList<Message>();
  @observable
  bool isResponseLoading = false;
  final scrollController = ScrollController();
  @observable
  bool isDatabaseSelected = true;

  @action
  void addMessage(String content, bool isAssistant) {
    final message = Message(content: content, isAssistant: isAssistant);
    messages.add(message);
  }

  @action
  void receiveMessageFromAssistant() {
    isResponseLoading = true;
    addMessage('', true);
  }

  @action
  void editLastMessageWithContent(String content) {
    final message = Message(content: content, isAssistant: true);
    messages[messages.length - 1] = message;
    isResponseLoading = false;
  }

  @action
  void sendMessageFromUser(String content) {
    isResponseLoading = true;
    addMessage('', false);
    isResponseLoading = false;
    editLastMessageWithContent(content);
  }

  @action
  void setIsDatabaseSelected(bool isSelected) {
    isDatabaseSelected = isSelected;
  }

  @action
  void clearChats() {
    messages.clear();
    addMessage(Constants.firstMessage, true);
  }
}
