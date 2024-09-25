import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Validate {
  void commonFunction(BuildContext context );
  factory Validate({String? name, required String email , required String password}) {
    if(name != null && name.length < 2 ){
      return NotifyInfoBar("Name is too short enter valid name");
    }
    if(email.isEmpty){
      return NotifyInfoBar("Please enter email");
    }
    if(password.length < 7){
      print("${password.length}");
      return NotifyInfoBar("Password must be greater than 8 character");
    }
    return ValidationSuccess();
  }
}


class NotifyInfoBar implements Validate {
  final String content;

  NotifyInfoBar(this.content);
  @override
  void commonFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black26,
        content: Text(content,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.yellowAccent),),
      ),
    );
    throw Exception(content);
  }
}

class ValidationSuccess implements Validate {
  @override
  void commonFunction(BuildContext context) {
    print("The data is validated");
  }
}

class IdleValidated implements Validate {
  @override
  void commonFunction(BuildContext context) {
    // TODO: implement commonFunction
  }

}
