import 'package:flutter/material.dart';
import 'package:yes_or_no_app/providers/get_yes_no_aswer.dart';

import '../domain/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAswer _getYesNoAswer = GetYesNoAswer();

  List<Message> messages = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Adios", fromWho: FromWho.me),
  ];

  void sendMessage(String text) async {
    messages.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToButtom();
    if(text.endsWith("?")) await getReplay();
  }

  void moveScrollToButtom() async {
    await Future.delayed(Duration(seconds: 1));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  Future<void> getReplay() async{
    final Message answer = await _getYesNoAswer.getAnswer();
    messages.add(answer);
    notifyListeners();
    moveScrollToButtom();
  }
}
