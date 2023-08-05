import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  Map<String, String>? params;
  ChatPage({Key? key, this.params}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
