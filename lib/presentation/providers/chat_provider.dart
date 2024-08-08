import 'package:first_app/config/helpers/get_yes_no_answer.dart';
import 'package:first_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.hers),
    Message(text: 'Adios', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    if (text.endsWith('?') || text.endsWith('? ')) {
      await herReply();
    } else {
      messageList.add(Message(text: text, fromWho: FromWho.mine));
    }
    notifyListeners();
    scrollToBottom();
  }

  Future<void> herReply() async {
    final herReply = await getYesNoAnswer.getAnswer();
    messageList.add(herReply);
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
