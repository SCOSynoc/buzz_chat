import 'package:buzz_chat/blocs/MessageBlocs/message_blocs.dart';
import 'package:buzz_chat/blocs/MessageBlocs/message_events.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_bloc.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../blocs/RandonJoinBloc/join_events.dart';
import '../models/Guest.dart';
import '../models/Users.dart';
import '../utils/utils.dart';
import 'chat_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<JoinBloc>().add(JoinRandomRequested(gender: anonymousGenderNotify.value, isOnline: true, isGuest: true));
    return BlocConsumer<JoinBloc,JoinStates>(
      listener: (BuildContext context, JoinStates state) {
        /*if(state is PleaseWaitToJoin){
          bool isWaiting = state.waiting;
          bool isGuest = state.isUserGuest;
          print("Here user is guest :: ${state.isUserGuest} and ${state.userFound}");
          if(state.userFound){
            if(state.randomJoined != null) {
              context.read<JoinBloc>().add(GetRandomUserData(randomJoined: state.randomJoined! ));
              Users? user = state.randomJoined?.users;
              Guest? guest = state.randomJoined?.guest;
              print("HEre user value is ${user?.userUid}");
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ChatScreen(randomJoinedGuest:guest, randomJoinedUser: user,)));
            }else{
              print("HEre user value is nothing");
              showSnackBar(context: context, content: "User not found try again");
            }

          }
        }*/

        if(state is FailedToJoinRandomUser) {
          showSnackBar(context: context, content: state.message);
          Navigator.pop(context);
        }

        if(state is ChatRoomCreatedWithUsers) {
          print("The dta of chat rooms are ${state.chatroomId}");
          context.read<MessageBlocs>().add(GetChatroomIdsRequest(
              chatroomId: state.chatroomId, currUserId: state.currentUserId, ranUserId: state.randomUserId));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              ChatScreen(currentUserId: state.currentUserId, randomUserId: state.randomUserId, chatRoomID: state.chatroomId,)));
        }


      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(color: Colors.black),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SpinKitChasingDots(
                  color: Colors.yellowAccent, size: 120,
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}
