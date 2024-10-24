import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsLists extends StatefulWidget {
  const FriendsLists({super.key});

  @override
  State<FriendsLists> createState() => _FriendsListsState();
}

class _FriendsListsState extends State<FriendsLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
        return const ListTile(
          title: Text("Friend Name"),
          subtitle: Text('Interests'),
          shape: Border(bottom: BorderSide(color: Colors.yellowAccent, width: 0.5),),
        );
    });
  }
}
