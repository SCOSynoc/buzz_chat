import 'dart:convert';
import 'dart:io';
import 'package:buzz_chat/models/RandomJoined.dart';
import 'package:buzz_chat/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../blocs/AuthBlocs/auth_bloc.dart';
import '../models/Guest.dart';
import '../models/Users.dart';
import 'dart:math';

import 'Local_storage.dart';

abstract class AuthRepository {
  void initializeInstances();

  Future<void> signInUserWithEmailAndPassword({ required String email ,
    required String password,
    required String name});

  Future<void> loginUserWithEmailAndPassword({
    required String email ,
    required String password,
  });

  Future<void> signInAnonymously() ;

  Future<Users?> getCurrentUserData();

}

class AuthService extends AuthRepository {

  late FirebaseAuth _auth;
  late FirebaseFirestore _firebase;
  HiveService _local = HiveService()..initLocalService();


  @override
  Future<Users?> getCurrentUserData() async{
    Users? user;
    if(_auth.currentUser == null){
      return user;
    }else{
      var userData = await _firebase.collection("users").doc(_auth.currentUser!.uid).get();
      if(userData.data() != null){
        user = Users.fromJson(userData.data()!);
      }
      return user;
    }
  }


  Future<void> saveGuestToFirestore({
    required String guestIP,
    required String gender,
    required bool isOnline,
    required bool isAuthed,
    File? mobileImage,
  }) async{
    try{
      String uid = _auth.currentUser!.uid;
      String imageUri = "";

      Guest guestUser = Guest(
          uid: uid,
          guestIP: guestIP,
          gender: gender,
          isOnline: isOnline,
          isAuthed: isAuthed
      );


      await _firebase.collection("guest").doc(uid).set(guestUser.toJson());
    }  catch(e){
      print("Error with saveUserDatatoFirestoreFunction():: ${e}");
      throw Exception("saveGuestDatatoFirestoreFunction():: ${e}");
    }

  }


  Future<void> saveUserToFirestore({
    required String userDeviceIP,
    required String gender,
    required bool isOnline,
    required bool isAuthed,
    required String userName,
    required String userEmail,
    File? mobileImage,
  }) async{
    try{
      String uid = _auth.currentUser!.uid;
      String imageUri = "";

      Users user = Users(
          userUid: uid,
          isOnline: isOnline, friendsList: [], userName: userName,
          userEmail: userEmail,
          userIpAddress: "",
          userImage: '', gender: gender,
          friendsRequestList: [],
          userDeviceIp:
          userDeviceIP, userInterest: [], isAuthed: isAuthed, saveChats: [],

      );

      await _firebase.collection("users").doc(uid).set(user.toJson());
    }  catch(e){
      print("Error with saveUserDatatoFirestoreFunction():: ${e}");
      throw Exception("saveUserDatatoFirestoreFunction():: ${e}");
    }
  }



  void logoutCurrentUser() async {
    bool anonymous = _auth.currentUser?.isAnonymous ?? false;
    if(anonymous){
      await _firebase.collection("users").doc(_auth.currentUser?.uid).delete();
      _auth.currentUser?.delete();
    }else{
      _auth.signOut();
    }
  }



  @override
  void initializeInstances() {
    _auth = FirebaseAuth.instance;
    _firebase = FirebaseFirestore.instance;
  }

  @override
  Future<bool> loginUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch(e){
      throw Exception(e.message);
    } on Exception catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> signInAnonymously() async {
    try {
          await _auth.signInAnonymously();
      print("Signed in with temporary account.");
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          return false;
        default:
          print("Unknown error.");
          return false;
      }
    }
  }

  @override
  Future<bool> signInUserWithEmailAndPassword({required String email, required String password, required String name}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch(e){
      throw Exception(e.message);
    } on Exception catch(e) {
      throw Exception(e);
    }
  }
  
  void updateUserOnlineStatus(bool isOnline)async{
    try{
       await _firebase.collection("users").doc(_auth.currentUser?.uid).update({
         "isOnline": isOnline
       });/*.onError((e,s){
         print("The error is $e and Stacktrace is $s");
       });*/
    }catch(e, stack){
      throw Exception("updateUserOnlineStatus():: $e and $stack");
    }
  }

  Future<bool> deleteGuestUserData()async{
    print("Local data in deleteGuestUserData() :: ${_auth.currentUser?.uid}");
    try{
      await _firebase.collection("guest").doc(_auth.currentUser?.uid).delete();
      return true;
    }catch(e, stack){
      if (kDebugMode) {
        print(("deleteGuestUserData():: $e and $stack"));
      }
      return false;
    }
  }


  Future<RandomJoined> joinUserWithStranger({required String gender, required bool isGuest}) async
  {

      try {
        List<Map<String,dynamic>> onlineUsers = [];
         var onlineUsersData = await _firebase.collection("users")
             .where("isOnline",isEqualTo: true)
             .where("gender",isEqualTo: gender)
             .where('userUid', isNotEqualTo: _auth.currentUser?.uid)
             .get();
        for(var document in onlineUsersData.docs) {
          onlineUsers.add(document.data());
        }
         print("Here online user list is ${onlineUsers} and ${onlineUsersData.docs}");
        List<Map<String,dynamic>> onlineReqUsersList = [];
        onlineReqUsersList = filterList(online: true, gender: gender, filteringList: onlineUsers, filteredList: onlineReqUsersList);
        /*print("Here sorted user list is ${onlineReqUsersList} and ${onlineReqUsersList.length} ");*/
        int indexValue = Random().nextInt(onlineReqUsersList.length);
        print(indexValue);
        print("random selected user is ${onlineReqUsersList[indexValue]}");
        Users? rUserData;
        Guest? rGuestData;
        _firebase.collection("users")
            .doc(_auth.currentUser?.uid)
            .collection("chats").
            doc(onlineReqUsersList[indexValue]["userUid"])
            .set({});
        _firebase.collection("users")
            .doc(onlineReqUsersList[indexValue]["userUid"])
            .collection("chats")
            .doc(_auth.currentUser?.uid)
            .set({});
            rUserData = Users.fromJson(onlineReqUsersList[indexValue]);
          return RandomJoined(joined: true,users: rUserData, guest: rGuestData);
      }catch(e) {
        print(("joinUserWithStranger()::$e"));
            return const RandomJoined(joined: false);
      }
  }

  Future<String?> getRandomStrangerToJoin({required String gender}) async{
    final usersSnapshot = await _firebase.collection('users')
        .where('gender', isEqualTo: gender,)
        .where('isOnline' ,isEqualTo: true)
        .get();
    final users = usersSnapshot.docs.map((doc) => doc.id).toList();
    users.remove(_auth.currentUser?.uid); // Remove current user from list
    users.shuffle();
    return users.isNotEmpty ? users.first: null;
  }

  Future<String> getOrCreateChatRoom({required String userId1, required String userId2}) async {
    final chatRoomsSnapshot = await _firebase.collection('chatRooms')
        .where('users', arrayContainsAny: [userId1, userId2])
        .get();
    for (var doc in chatRoomsSnapshot.docs) {
      if ((doc['users'] as List).contains(userId1) && (doc['users'] as List).contains(userId2)) {
        return doc.id;
      }
    }
    final chatRoom = await _firebase.collection('chatRooms').add({
      'users': [userId1, userId2],
      'timestamp': FieldValue.serverTimestamp(),
    });
    return chatRoom.id;

  }
  
  
  Future<bool> sendOrCancelFriendRequest(String userId, String friendId) async {
    DocumentSnapshot doc = await _firebase.collection("users").doc(userId).get();
    if(doc.get('friendsRequestList').contains(friendId)) {
      print("THis value true is called or not");
      await _firebase.collection('users').doc(userId).update({'friendsRequestList': FieldValue.arrayRemove([friendId])});
      await _firebase.collection('users').doc(friendId).update({'friendsRequestList': FieldValue.arrayRemove([userId])});
      return true;
    } else{
      print("THis value  false is called or not");
      await _firebase.collection('users').doc(userId).update({'friendsRequestList': FieldValue.arrayUnion([friendId])});
      await _firebase.collection('users').doc(friendId).update({'friendsRequestList': FieldValue.arrayUnion([userId])});
      return false;
    }
  }

  Future<bool> acceptOrRejectFriendRequest(String userId, String friendId)async {
    DocumentSnapshot doc = await _firebase.collection("users").doc(userId).get();
    if(doc.get('friendsList').contains(friendId)) {
      await _firebase.collection('users').doc(userId).update({'friendsList': FieldValue.arrayRemove([friendId])});
      await _firebase.collection('users').doc(friendId).update({'friendsList': FieldValue.arrayRemove([userId])});
      return true;
    } else{
      await _firebase.collection('users').doc(userId).update({'friendsList': FieldValue.arrayUnion([friendId])});
      await _firebase.collection('users').doc(friendId).update({'friendsList': FieldValue.arrayUnion([userId])});
      return false;
    }
  }

  Future<bool> checkIfAlreadyAFriend(String userId, String friendId) async{
    DocumentSnapshot doc = await _firebase.collection("users").doc(userId).get();
    if(doc.get('friendsList').contains(friendId)) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool> checkIfAFriendRequestSentOrNot(String userId, String friendId) async{
    DocumentSnapshot doc = await _firebase.collection("users").doc(userId).get();
    if(doc.get('friendsRequestList').contains(friendId)) {
      return true;
    }else{
      return false;
    }
  }

  




 Users getChatDataOfUser(Map<String,dynamic> user){
    return Users.fromJson(user);
  }

 Guest getChatDataOfGuest(Map<String,dynamic> guest){
    return Guest.fromJson(guest);
  }








  

}
