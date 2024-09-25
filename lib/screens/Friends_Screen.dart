
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (value)  {
                setState(() {
                  _currentIndex = value;
                });
              },
              indicatorColor: Colors.yellowAccent,
              indicatorWeight: 4,
              labelColor: Colors.yellowAccent,
              unselectedLabelColor: Colors.grey.shade100,
              dividerColor: Colors.yellowAccent,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs:   [
                Tab(
                  text: 'FRIENDS',
                ),
                Tab(
                  text: 'REQUESTS',
                ),
                Tab(
                  text: 'SENT',
                ),
                Tab(
                  text: 'PENDING REQUESTS',
                ),

              ]
          ),
        ),
      ),
    );

  }
}
