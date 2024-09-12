import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.him),
    Message(text: 'Hola', fromWho: FromWho.me),
  ];

  void sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);
    notifyListeners();
  }
}
