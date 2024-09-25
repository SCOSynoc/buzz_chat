import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/blocs/RandonJoinBloc/join_bloc.dart';
import 'package:buzz_chat/screens/Dashboard_Screen.dart';
import 'package:buzz_chat/screens/onboard_screen.dart';
import 'package:buzz_chat/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'bloc_observer.dart';
import 'blocs/AuthBlocs/auth_bloc.dart';
import 'blocs/MessageBlocs/message_blocs.dart';
import 'firebase_options.dart';

void main() async{
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(localStorageBox);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isAuthed = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AlreadyAuthenticatedCheck())),
        BlocProvider(create: (context) => JoinBloc()),
        BlocProvider(create: (context) => MessageBlocs()),

      ],
      child:MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor:Colors.greenAccent ,
            colorScheme: ColorScheme.fromSeed(
                primary:Colors.greenAccent ,
                seedColor: Colors.greenAccent, brightness: Brightness.dark),
            useMaterial3: true,
            textTheme: TextTheme(
              displayLarge: GoogleFonts.actor(),
              displayMedium: GoogleFonts.actor(),
              displaySmall: GoogleFonts.actor(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              labelSmall: GoogleFonts.acme(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
              labelLarge: GoogleFonts.acme(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold,fontSize: 24),
              labelMedium: GoogleFonts.acme(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold,fontSize: 18),
            )
          ),
          home: BlocConsumer<AuthBloc,AuthStates>(
            listener: (context,state) {
              if(state is AlreadyAuthenticated){
                  isAuthed = state.authenticated;
                  if(isAuthed) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                            (Route<dynamic> route) => false);
                  }
              }
            },
            builder: (context, state) {
              return const OnboardScreen() ;
            }
          ),
        )
    );
  }
}









