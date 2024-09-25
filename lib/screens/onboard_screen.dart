import 'package:animations/animations.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/screens/Dashboard_Screen.dart';
import 'package:buzz_chat/screens/login_screen.dart';
import 'package:buzz_chat/screens/signin_screen.dart';
import 'package:buzz_chat/utils/utils.dart';
import 'package:buzz_chat/widgets/common_button.dart';
import 'package:buzz_chat/widgets/gender_radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'choose_gender.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocConsumer<AuthBloc, AuthStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 const Spacer(),
                 ChooseGender(theme: theme),
                 Spacer(),
                 CommonButton(onTap: (){
                   context.read<AuthBloc>().add(AnonymousLogin(gender: anonymousGenderNotify.value));
                 }, buttonText: "Chat Anonymously"),
                 const Padding(
                   padding: EdgeInsets.all(18.0),
                   child: Text("----------------------OR----------------------"),
                 ),
                 CommonButton(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                 }, buttonText: "Sign up"),
                 const Spacer(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   const Text("Already signed up ?"),
                     TextButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                       }, child: const Text("Sign in"))
                 ],),
                 const Spacer()

            ],
          ),
        );
      }, listener: (BuildContext context, AuthStates state) {
        if(state is AnonymousSignInSuccess) {
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
           DashboardScreen(isUserGuest: state.isGuest,)),
                   (Route<dynamic> route) => false);
        }

        if(state is AnonymousSignInFailure) {

        }
    },
    );
  }
}


