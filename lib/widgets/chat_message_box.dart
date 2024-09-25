import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Message.dart';
import 'message_bubble.dart';

class ChatMessageBox extends StatelessWidget {
  const ChatMessageBox({
    super.key,
    required ScrollController scrollController,
    required this.chatDocs,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<Message> chatDocs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        reverse: true,
        itemCount: chatDocs.length,
        itemBuilder: (ctx, index) => OpenContainer(
          tappable: false,
          openColor: Colors.black,
          closedColor:Colors.black,
          transitionType: ContainerTransitionType.fade,
          closedElevation: 0,
          openElevation: 4,
          closedBuilder: (ctx, action) => Hero(
            tag: "1",
            child: MessageBubble(
              message: chatDocs[index].message,
              isMe: chatDocs[index].senderId == FirebaseAuth.instance.currentUser?.uid,
            ),
          ),
          openBuilder: (ctx, action) => Scaffold(
            body: Center(
              child: Hero(
                tag: "1",
                child: Material(
                  surfaceTintColor: Colors.black,
                  child: MessageBubble(
                    message: chatDocs[index].message,
                    isMe: chatDocs[index].senderId == chatDocs[index].receiverId,
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}