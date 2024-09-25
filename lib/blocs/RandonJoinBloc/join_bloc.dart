

import 'package:buzz_chat/blocs/MessageBlocs/message_events.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_events.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_states.dart';
import 'package:buzz_chat/models/RandomJoined.dart';
import 'package:buzz_chat/repository/auth_repositury.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinBloc extends Bloc<JoinEvents,JoinStates> {
   JoinBloc(): super(JoinInitialState()) {
     on<JoinRandomRequested>(_joinWithRandomStranger);
     on<GetRandomUserData>(_getJoinedUserData);
     on<GetRandomStrangerToJoin>(_getRandomStrangerToJoin);
   }


   final AuthService _service = AuthService()..initializeInstances();

   void _joinWithRandomStranger(JoinRandomRequested event, Emitter<JoinStates> emit) async{
         emit(PleaseWaitToJoin(waiting: true, isUserGuest: event.isGuest, userFound: false));
         RandomJoined joinedUser = await _service.joinUserWithStranger(  gender: event.gender, isGuest: event.isGuest,);
         print("The value of Random joined is ${joinedUser.users} ${joinedUser.guest}");
         if(joinedUser.joined){
           print("The value of Random joined is true ${joinedUser.users} ${joinedUser.guest}");
           emit(PleaseWaitToJoin(waiting: false,isUserGuest: event.isGuest, userFound: joinedUser.joined, randomJoined: joinedUser));
         }else{
           print("The value of Random joined is false ${joinedUser.users} ${joinedUser.guest} and ${joinedUser.joined}");
           emit(PleaseWaitToJoin(waiting: false,isUserGuest: event.isGuest, userFound: joinedUser.joined, randomJoined: joinedUser));
         }

         add(GetRandomStrangerToJoin(gender: event.gender, isOnline: true));


   }

   void _getJoinedUserData(GetRandomUserData event, Emitter<JoinStates> emit) async {
       if(event.randomJoined.users == null) {
         print("THIS randomJoined.users null BLOCK IS EXECUTING");
         emit(UserJoinedData(guest: event.randomJoined.guest));
       }else if(event.randomJoined.guest == null){
         print("THIS randomJoined.guest null BLOCK IS EXECUTING");
         emit(UserJoinedData(users: event.randomJoined.users));
       }else{
         print("THIS No user BLOCK IS EXECUTING");
         emit(UserJoinedData(message: "NO USER FOUND"));
       }
   }

   void _getRandomStrangerToJoin(GetRandomStrangerToJoin event, Emitter<JoinStates> emit) async {
        String? user =  await  _service.getRandomStrangerToJoin(gender: event.gender);
        print("user is to join is $user");
        if(user == null) {
          emit(FailedToJoinRandomUser(message: "No user found"));
        }else{
          String chatroom = await _service.getOrCreateChatRoom(userId1: user,
              userId2: FirebaseAuth.instance.currentUser?.uid ?? "");
          if(chatroom.isNotEmpty){
            emit(ChatRoomCreatedWithUsers(currentUserId: FirebaseAuth.instance.currentUser?.uid ?? '',
                randomUserId: user, chatroomId: chatroom));
          }
        }
   }

}