import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_bloc.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_events.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_states.dart';
import 'package:buzz_chat/models/Guest.dart';
import 'package:buzz_chat/screens/Loading_Screen.dart';
import 'package:buzz_chat/screens/choose_gender.dart';
import 'package:buzz_chat/utils/utils.dart';
import 'package:buzz_chat/widgets/loading_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/Users.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isUserGuest});
  final bool? isUserGuest;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isWaiting = false;
  bool isGuest = false;

  @override
  void initState() {

    super.initState();
    context.read<AuthBloc>().add(CheckUserIsGuestOrNot());


  }

  void redirect() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2)).then((value) {
       setState(() {
         isLoading = false;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocConsumer<JoinBloc,JoinStates>(
      listener: (BuildContext context, JoinStates state) {
        if(state is PleaseWaitToJoin){
          isWaiting = state.waiting;
          isGuest = state.isUserGuest;
          print("Here user is guest :: ${state.isUserGuest} and ${state.userFound}");
          if(state.userFound){
            if(state.randomJoined != null) {
              context.read<JoinBloc>().add(GetRandomUserData(randomJoined: state.randomJoined! ));
              Users? user = state.randomJoined?.users;
              Guest? guest = state.randomJoined?.guest;
              print("HEre user value is ${user?.userUid}");
              /*Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ChatScreen(randomJoinedGuest:guest, randomJoinedUser: user,)));*/

            }else{
              showSnackBar(context: context, content: "User not found try again");
            }

          }
        }

      },
      builder: (context, snapshot) {
        return LoadingManager(
          isLoading: isWaiting,
          child: Scaffold(
            appBar: AppBar( centerTitle:true, title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.searchengin, size: 10,),
                Text("Find"),
              ],
            ),),
            body: isWaiting ?
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitSpinningLines(color: Colors.white,size: 60, ),
                Text("Finding a stranger for you.......")
              ],
            ):Column(
              children: [
                const Spacer(),
                ChooseGender(theme: theme),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: BlocListener<AuthBloc,AuthStates>(
                    listener: (BuildContext context, AuthStates state) {
                      if(state is CheckGuestSuccess){
                        isGuest = state.isGuest;
                        print("In ui screen guest value is $isGuest");
                      }
                    },
                    child: InkWell(
                      splashColor: Colors.grey,
                      borderRadius: BorderRadius.circular(32),
                      onTap: (){
                           // context.read<JoinBloc>().add(JoinRandomRequested(gender: anonymousGenderNotify.value, isOnline: true, isGuest: isGuest));
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const LoadingScreen()));
                      },
                      child: SizedBox(
                        width:200,
                        height: 70,
                        child: Card(
                          surfaceTintColor: Colors.grey,
                          elevation: 50,
                          color: Colors.black26,
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.yellowAccent, width: 2, strokeAlign: BorderSide.strokeAlignOutside),
                              borderRadius: BorderRadius.circular(32)
                          ),
                          child: Center(child: Text("Find Stranger", style: theme.textTheme.labelLarge,)),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }



}
