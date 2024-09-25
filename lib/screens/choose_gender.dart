import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/utils.dart';

class ChooseGender extends StatelessWidget {
  const ChooseGender({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: anonymousGenderNotify, builder: (context, child, value){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Select who you want chat with ", style: theme.textTheme.labelMedium,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                IconButton(
                  onPressed: (){
                    anonymousGenderNotify.value = "Female";
                  }, icon: const FaIcon(FontAwesomeIcons.personDress),
                  color: anonymousGenderNotify.value == "Female" ? Colors.yellowAccent : Colors.white,
                ),
                Text("Female")
              ],),
              Column(children: [
                IconButton(onPressed: (){
                  anonymousGenderNotify.value = "Male";
                }, icon: const FaIcon(FontAwesomeIcons.person),
                  color: anonymousGenderNotify.value == "Male" ? Colors.yellowAccent : Colors.white,
                ),
                const Text("Male")
              ],),
              Column(children: [
                IconButton(onPressed: (){
                  anonymousGenderNotify.value = "Others";
                }, icon: const FaIcon(FontAwesomeIcons.genderless),
                  color: anonymousGenderNotify.value == "Others" ? Colors.yellowAccent : Colors.white,
                ),
                const Text("Others")
              ],)
            ],),
        ],
      );
    });
  }
}