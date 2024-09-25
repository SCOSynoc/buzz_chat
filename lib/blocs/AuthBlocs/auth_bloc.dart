
import 'dart:convert';

import 'package:buzz_chat/repository/Local_storage.dart';
import 'package:buzz_chat/repository/auth_repositury.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_ip_address/get_ip_address.dart';

import '../../models/Users.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates> {
  AuthBloc(): super(AuthInitial()) {
    on<AnonymousLogin>(_onAnonymousLoginRequest);
    on<SignUpRequested>(_onSignupRequest);
    on<SignInRequested>(_onSignInRequested);
    on<AlreadyAuthenticatedCheck>(_checkAuthentication);
    on<UpdateUserOnlineStatus>(_updateUserStatus) ;
    on<LogoutRequested>(_onLogoutSuccess);
    on<CheckUserIsGuestOrNot>(_onCheckUserGuest);
    on<DeleteAnonymousCurrentGuestUser>(_onDeleteGuestUserRequest);
    on<GetUserDataFromLocalData>(_onGetUserDataFromLocalData);
    on<SendFriendRequest>(_onSendOrCancelFriendRequest);
    on<AcceptFriendRequest>(_onAcceptFriendRequest);
    on<RequestCheckIfAlreadyAFriend>(_onCheckIfAlreadyAFriend);
  }
}

 AuthService service = AuthService()..initializeInstances();
 HiveService local = HiveService()..initLocalService();

 Future<Map<String, dynamic>> getIp( ) async{
   Map<String,dynamic> dataIp = {};
   try {
     /// Initialize Ip Address
     var ipAddress = IpAddress(type: RequestType.json);

     /// Get the IpAddress based on requestType.
     dynamic data = await ipAddress.getIpAddress();
     // dataIp = json.decode(data);
     print(data.runtimeType);
     return data;
   } on IpAddressException catch (exception) {
     /// Handle the exception.
     print(exception.message);
     return {"error": "", "ip": " "};
   }
 }

  void _onAnonymousLoginRequest(AnonymousLogin event, Emitter<AuthStates> emit) async {
   Map<String,dynamic> dataIp = await getIp();
    try{
      emit(AuthLoading(loading: true));
      bool done = await service.signInAnonymously();
      if(done){
        try{
          await service.saveUserToFirestore( gender: event.gender, isOnline:false, isAuthed: false, userDeviceIP: dataIp["ip"], userName: '', userEmail: '');
          local.addData(key: "isUserGuest", value: jsonEncode(true));

        }catch(e){
          Exception("Error in guest store() :: ${e}");
        }
        emit(AnonymousSignInSuccess(isGuest: true));
      }else{
        emit(AuthLoading(loading: false));
        emit(AnonymousSignInFailure());
      }
    }catch(e){
      emit(AuthLoading(loading: false));
      throw Exception("onAnonymousLoginRequest() :: $e");
    }
  }

  void _onSignupRequest(SignUpRequested event, Emitter<AuthStates> emit) async {
    emit(AuthLoading(loading: true));
    Map<String,dynamic> dataIp = await getIp();
    try{
      emit(AuthLoading(loading: true));
      bool done = await service.signInUserWithEmailAndPassword(
          email: event.email, password: event.password, name: event.name);
      if(done){
         await service.saveUserToFirestore(userDeviceIP: dataIp["ip"], gender: event.gender, isOnline: true, isAuthed: true,
             userName: event.name, userEmail: event.email, );
        emit(SignUpSuccess());
      }else{
        emit(SignUpFailure());
        emit(AuthLoading(loading: false));
      }
    }catch(e){
      emit(SignUpFailure());
      emit(AuthLoading(loading: false));
      print("onSignupRequest() :: $e");
    }
  }

  void _onSignInRequested(SignInRequested event, Emitter<AuthStates> emit) async {
    try{
      emit(AuthLoading(loading: true));
      bool done = await service.loginUserWithEmailAndPassword(
          email: event.email, password: event.password,);
      if(done){
        emit(SignInSuccess());
      }else{
        emit(AuthLoading(loading: false));
        emit(SignInFailure());

      }
    }catch(e){
      emit(AuthLoading(loading: false));
      emit(SignInFailure());
      print("onAnonymousLoginRequest() :: $e");
    }
  }

  /// authentication check functions
  void _checkAuthentication(AlreadyAuthenticatedCheck event, Emitter<AuthStates> emit) async{
    emit(AuthLoading(loading: true)) ;
    try {
      String? data = local.getData(key: "userData");
      print("here the checked data is user from local hive storage Authentication check :: () $data");
      if(data != null) {
        emit(AlreadyAuthenticated(authenticated: true));
      }else{

        try{
          Users? user = await  service.getCurrentUserData();
          print("elec-bloc-exceuted and user is $user");
          if(user == null) {
            emit(AlreadyAuthenticated(authenticated: false));
          }else{
            local.addData(key: "userData", value: jsonEncode(user.toJson()));
            emit(AlreadyAuthenticated(authenticated: true));
          }
        }catch(e){
          throw Exception("Firebase exception is $e");
        }
      }

    }catch(e) {
      emit(AlreadyAuthenticated(authenticated: false));
      throw Exception("$e");

    }
  }

  void _updateUserStatus(UpdateUserOnlineStatus event, Emitter<AuthStates> emit)async {
   try{
     service.updateUserOnlineStatus(event.isOnline);
     emit(UserOnlineStatus(isOnline: event.isOnline));
   }catch(_,__) {
     emit(UserOnlineStatus(isOnline: false));
     throw Exception("error $_ and $__");
   }
  }

  void _onLogoutSuccess(LogoutRequested event, Emitter<AuthStates> emit) async{
      local.removeData(key: "userData");
      local.removeData(key: "isUserGuest");
      service.logoutCurrentUser();
      emit(SignOutSuccess());
  }

  void _onCheckUserGuest(CheckUserIsGuestOrNot event, Emitter<AuthStates> emit) async{
      String? isGuest = local.getData(key: "isUserGuest",);
      bool check = json.decode(isGuest ?? "false");
      print("here check is $check and its ${check.runtimeType}");
      emit(CheckGuestSuccess(isGuest: check));
  }

  void _onDeleteGuestUserRequest(DeleteAnonymousCurrentGuestUser event,Emitter<AuthStates> emit )async {
     bool deleted = await service.deleteGuestUserData();
     if(deleted){
       emit(GuestDeletedSuccess(deleted: deleted));
     }else{
       emit(GuestDeletedSuccess(deleted: deleted));
     }
  }

  void _onGetUserDataFromLocalData(GetUserDataFromLocalData event, Emitter<AuthStates> emit) async {
     dynamic userData = await local.getData(key: 'userData');
     Users userDataToShow = Users.fromJson(jsonDecode(userData));
     emit(LocalCurrentUserDataReceived(user: userDataToShow));
  }

  void _onSendOrCancelFriendRequest(SendFriendRequest event, Emitter<AuthStates> emit) async{
   print("The event called this is great ${event.friendId} and ${event.userId}");
       bool sentOrCancel = await service.sendOrCancelFriendRequest(event.userId, event.friendId);
       if(sentOrCancel){
         emit(FriendRequestSent(alreadySent: sentOrCancel));
       }else{
         emit(FriendRequestSent(alreadySent: sentOrCancel));
       }
  }

  void _onAcceptFriendRequest(AcceptFriendRequest event, Emitter<AuthStates> emit)async {
    bool acceptOrReject = await service.acceptOrRejectFriendRequest(event.userId, event.friendId);
    if(acceptOrReject){
      emit(RequestAccepted(acceptOrReject: acceptOrReject));
    }else{
      emit(RequestAccepted(acceptOrReject: acceptOrReject));
    }
  }

  void _onCheckIfAlreadyAFriend(RequestCheckIfAlreadyAFriend event, Emitter<AuthStates> emit) async {
   bool done = await service.checkIfAlreadyAFriend(event.userId, event.friendId);
  }