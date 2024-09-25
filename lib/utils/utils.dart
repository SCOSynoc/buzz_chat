import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<dynamic> data = [
  {
    "sender": "Alice",
    "timestamp": "2024-06-18T09:15:00",
    "message": "Hey Bob, how are you doing today?"
  },
  {
    "sender": "Bob",
    "timestamp": "2024-06-18T09:16:00",
    "message": "Hi Alice, I'm good! Just working on some SQL queries. How about you?"
  },
  {
    "sender": "Alice",
    "timestamp": "2024-06-18T09:17:00",
    "message": "I'm doing well, thanks! SQL queries, huh? Are you working on something interesting?"
  },
  {
    "sender": "Bob",
    "timestamp": "2024-06-18T09:18:00",
    "message": "Yeah, I'm trying to optimize our stored procedures to improve performance. It's a bit challenging but fun."
  },
  {
    "sender": "Alice",
    "timestamp": "2024-06-18T09:19:00",
    "message": "Sounds interesting! Stored procedures can really make a difference. Need any help with it?"
  },
  {
    "sender": "Bob",
    "timestamp": "2024-06-18T09:20:00",
    "message": "Thanks for the offer! I might take you up on that if I get stuck."
  },
  {
    "sender": "Alice",
    "timestamp": "2024-06-18T09:21:00",
    "message": "Sure thing, just let me know. I'm happy to help!"
  },
  {
    "sender": "Bob",
    "timestamp": "2024-06-18T09:22:00",
    "message": "Will do! Have a great day, Alice."
  },
  {
    "sender": "Alice",
    "timestamp": "2024-06-18T09:23:00",
    "message": "You too, Bob! Talk to you later."
  }
];

const localStorageBox = 'localStorageBox';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

ValueNotifier genderNotify =  ValueNotifier("");
ValueNotifier anonymousGenderNotify = ValueNotifier("");


/*
List<Map<String,dynamic>> guest = [
  {"gender":"male", "online":true, "guest":true, "id":1},
  {"gender":"female", "online":true, "guest":true, "id":2},
  {"gender":"female", "online":true, "guest":true, "id":3},
  {"gender":"female", "online":true, "guest":true, "id":4},
  {"gender":"male", "online":false, "guest":true, "id":5},
];

List<Map<String,dynamic>> users = [
  {"gender":"male", "online":false, "guest":false, "id":1},
  {"gender":"female", "online":true,"guest":false, "id":2},
  {"gender":"female", "online":true, "guest":false, "id":3},
  {"gender":"male", "online":true, "guest":false, "id":4},
  {"gender":"male", "online":false, "guest":false, "id":5},
];

List<Map<String,dynamic>> sortedUser = [];

for(var data in guest) {
if(data["online"] == true && data["gender"] == "female") {
sortedUser.add(data);
}
}

for(var data in users) {
if(data["online"] == true && data["gender"] == "female") {
sortedUser.add(data);
}
}

print("Here sorted user list is ${sortedUser} and ${sortedUser.length} ");

int indexValue = Random().nextInt(sortedUser.length);

print(indexValue);

print("random selected user is ${sortedUser[indexValue]}");

  */


List<Map<String,dynamic>> filterList({required bool online, required String gender, required List<Map<String,dynamic>> filteringList, required List<Map<String,dynamic>> filteredList }) {
    for (var data in filteringList){
      if(data["isOnline"] == true && data["gender"] == gender) {
        filteredList.add(data);
      }
    }

    print("It's happening in function ${filteredList}");

    return filteredList;
}
