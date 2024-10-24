import 'package:animations/animations.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/blocs/MessageBlocs/message_blocs.dart';
import 'package:buzz_chat/blocs/MessageBlocs/message_events.dart';
import 'package:buzz_chat/blocs/MessageBlocs/message_states.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_bloc.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_states.dart';
import 'package:buzz_chat/repository/Local_storage.dart';
import 'package:buzz_chat/widgets/common_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/AuthBlocs/auth_bloc.dart';
import '../models/Guest.dart';
import '../models/Message.dart';
import '../models/RandomJoined.dart';
import '../models/Users.dart';
import '../utils/utils.dart';
import '../widgets/chat_message_box.dart';
import '../widgets/message_bubble.dart';
import 'Dashboard_Screen.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({super.key, this.randomJoinedUser, this.randomJoinedGuest,
    required this.currentUserId, required this.randomUserId, required this.chatRoomID, });

  final Users? randomJoinedUser;
  final Guest? randomJoinedGuest;
  final String currentUserId;
  final String randomUserId;
  final String chatRoomID;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Users? randomJoinedUser;
  Guest? randomJoinedGuest;

  final HiveService _local = HiveService()..initLocalService();



  String text = "Add Friend";
  bool isLoading = false;

  Stream<List<Message>> msgList = Stream.value([]);

  void _sendMessage() {

    if (_controller.text.isNotEmpty) {
      data.add({
        "sender": "Alice",
        "timestamp": "2024-06-18T09:15:00",
        "message": _controller.text
      },);

      context.read<MessageBlocs>().add(SendMessageRequested(
          message: _controller.text, curUId: widget.currentUserId, ranUId: widget.randomUserId, chatRoomId: widget.chatRoomID)
      );

      _controller.clear();
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
   print("in chat screen initState():: ${widget.randomJoinedGuest?.gender} and ${widget.randomJoinedUser?.userName}");
   context.read<AuthBloc>().add(RequestCheckIfAlreadyAFriend(friendId: widget.randomUserId, userId: widget.currentUserId));
   context.read<MessageBlocs>().add(GetMessagesRequested(
       userUid: widget.currentUserId,
       messageUid: "",
       receiverId: widget.randomUserId, chatRoomId: widget.chatRoomID));
   context.read<AuthBloc>().add(CheckIfAlreadyARequestSent(friendId: widget.randomUserId, userId: widget.currentUserId));
   super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessageBlocs,MessageStates>(
      listener: (context,state) {

        if(state is MessageReceivedSuccess) {
          msgList = state.msgList;
        }

        if(state is ChatRoomDeleteSuccess) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen() )
              , (Route<dynamic> route) => false);
        }
      },
      builder: (context, snapshot) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool y) {
            showDialog(context: context, builder: (context) {
              return CupertinoAlertDialog(
                title: const Text("Alert"),
                content: const Center(
                  child: Text("Are you sure you want to exit chat"),
                ),
                actions: [
                  CupertinoButton(child: const Text("Yes"), onPressed: (){
                            context.read<MessageBlocs>().add(DeleteChatRoomRequest(chatRoomID: widget.chatRoomID));

                  }),
                  CupertinoButton(child: const Text("No"), onPressed: (){
                    Navigator.pop(context);
                  }),

                ],
              );
            });
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Anonymous chat"),

                ],
              ),

            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
                    stream: msgList,
                    builder: (ctx,  chatSnapshot) {
                      if (chatSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final chatDocs = chatSnapshot.data!;
                      return ChatMessageBox(scrollController: _scrollController, chatDocs: chatDocs);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*TextButton(onPressed: (){
                      // context.read<MessageBlocs>().add(SaveChatsRequest(chatRoomID: widget.chatRoomID));
                      context.read<MessageBlocs>().add(DeleteChatRoomRequest(chatRoomID: widget.chatRoomID));
                    },  child: const Text('Stop Chat'),),*/

                    BlocBuilder<AuthBloc,AuthStates>(
                      builder: (context,state) {
                        return TextButton(onPressed: (){
                             context.read<AuthBloc>().add(
                                 SendFriendRequest(friendId: widget.randomUserId, userId: widget.currentUserId)
                             );
                        },  child: BlocListener<AuthBloc,AuthStates>(
                            listener: (BuildContext context, state) {
                              if(state is AlreadyAFriend) {
                                setState(() {
                                  text = state.alreadyFriend ? "Cancel Request": "Add Friend";
                                  print('Here in front end chat screen in AlreadyAFriend - $text '
                                      'and state condition is ${state.alreadyFriend}');
                                });
                              }

                              if(state is AuthLoading) {
                                setState(() {
                                  isLoading = state.loading;
                                  print('Here in front end chat screen in AuthLoading - $text ');
                                });
                              }
                              if(state is FriendRequestSent) {
                                setState(() {
                                  text = state.alreadySent? "Cancel Request": "Add Friend";
                                  print('Here in front end chat screen in FriendRequestSent - $text '
                                      'and state condition is ${state.alreadySent}');
                                });
                              }
                            },
                            child: isLoading ? const CircularProgressIndicator.adaptive():Text(text)

                        ),
                        );
                      }
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: CommonTextField(
                          controller: _controller,
                          action: _sendMessage,
                          labelText: '', icon:
                        CupertinoIcons.chat_bubble_text,
                          isPassword: false,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

