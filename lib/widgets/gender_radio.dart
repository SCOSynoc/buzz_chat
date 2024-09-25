import 'package:buzz_chat/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderSelectors extends StatefulWidget {
  const GenderSelectors({super.key, required this.gender});
  final String gender;

  @override
  State<GenderSelectors> createState() => _GenderSelectorsState();
}

class _GenderSelectorsState extends State<GenderSelectors> {

  String _gender = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _gender = widget.gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: genderNotify,
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              children: [
                const Text('Male'),
                Radio<String>(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                      genderNotify.value = _gender;
                    });
                  },
                ),
              ],
            ),

            Row(
              children: [
                const Text('Female'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                      genderNotify.value = _gender;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('Others'),
                Radio<String>(
                  value: 'Others',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                      genderNotify.value = _gender;
                    });
                  },
                ),
              ],
            ),

          ],
        );
      },
    );
  }
}
