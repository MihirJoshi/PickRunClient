// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class ChatScreen extends StatefulWidget {
  String email, name;
  ChatScreen({Key? key, required this.email, required this.name})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    String _email = '${widget.email}';
    String _name = '${widget.name}';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pickrun Support'),
          backgroundColor: const Color.fromARGB(255, 228, 93, 100),
          elevation: 0,
        ),
        body: Tawk(
          directChatLink:
              'https://tawk.to/chat/6432c0cf31ebfa0fe7f7512a/1gtj42bob',
          visitor: TawkVisitor(
            name: _name,
            email: _email,
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}