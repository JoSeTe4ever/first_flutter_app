import 'package:first_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController(); 

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.hers),
    Message(text: 'Adios', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    messageList.add(Message(text: text, fromWho: FromWho.mine));
    notifyListeners();
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
