import 'package:avatar_glow/avatar_glow.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/screens/onboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:faker/faker.dart';
import 'package:animations/animations.dart';

import '../blocs/AuthBlocs/auth_states.dart';

class ProfileScreen extends StatelessWidget {

   String username = "" ;
   String avatarUrl = "" ;

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetUserDataFromLocalData());
    return BlocConsumer<AuthBloc,AuthStates>(
      listener: (context,state){


        if(state is LocalCurrentUserDataReceived) {
          username = state.user.userName.isEmpty ? "Random user" : state.user.userName;
        }

        if(state is SignOutSuccess) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OnboardScreen()),
                  (Route<dynamic> route) => false);
        }

      },
      builder: (context, snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  AvatarGlow(
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: Colors.white,
                    glowShape: BoxShape.circle,
                    animate: true,
                    curve: Curves.fastOutSlowIn,
                    child: Hero(
                      tag: 'profile-avatar',
                      child:FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 60,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Hero(
                    tag: 'profile-username',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        username,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  OpenContainer(
                    middleColor: Colors.transparent,
                    openElevation: 1,
                    openShape: const BeveledRectangleBorder(),
                    openColor: Colors.black,
                    transitionType: ContainerTransitionType.fade,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    closedColor: Colors.yellowAccent,
                    closedElevation: 5.0,
                    closedBuilder: (context, action) => Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    openBuilder: (context, action) {
                      context.read<AuthBloc>().add(LogoutRequested());
                      return SizedBox(
                          height:250, child: Center(child: LogoutScreen())) ;
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(

      title: Text("Logged out"),
      content: Center(
        child: Text("Logout successfull"),
      ),
      actions: [
        CupertinoButton(child: Text("login again"), onPressed: (){

        }),
        CupertinoButton(child: Text("ok"), onPressed: (){}),

      ],
    );
  }
}

