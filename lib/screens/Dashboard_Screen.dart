import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/screens/ChatListScreen.dart';
import 'package:buzz_chat/screens/Friends_Screen.dart';
import 'package:buzz_chat/screens/ProfileScreen.dart';
import 'package:buzz_chat/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.isUserGuest});
  final bool? isUserGuest;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with WidgetsBindingObserver {

  int currentPageIndex = 0;
  bool userGuest = false;


  List<Widget> tabs = [
    HomeScreen(),
    FriendsScreen(),
    ProfileScreen()
  ];


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.detached :
        // context.read<AuthBloc>().add(UpdateUserOnlineStatus(isOnline: false));
        break;
      case AppLifecycleState.inactive :
        context.read<AuthBloc>().add(DeleteAnonymousCurrentGuestUser());
        context.read<AuthBloc>().add(UpdateUserOnlineStatus(isOnline: false));
        break;
      case AppLifecycleState.hidden : break;
      case AppLifecycleState.paused :
        // context.read<AuthBloc>().add(UpdateUserOnlineStatus(isOnline: false));
        break;
      case AppLifecycleState.resumed :
        context.read<AuthBloc>().add(UpdateUserOnlineStatus(isOnline: true));
        break;
    }
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      userGuest = widget.isUserGuest ?? false;
    });
    context.read<AuthBloc>().add(UpdateUserOnlineStatus(isOnline: true));
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon:  Badge(child: Icon(Icons.message)),
            label: 'Messages',
            selectedIcon: Badge(child: Icon(Icons.message)),
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: tabs[currentPageIndex],
    );
  }
}
