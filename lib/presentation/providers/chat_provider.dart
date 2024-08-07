import 'package:first_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messages = [
    Message(text: 'Hola', fromWho: FromWho.hers),
    Message(text: 'Adios', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    messages.add(Message(text: text, fromWho: FromWho.mine));
    notifyListeners();
  }
}
