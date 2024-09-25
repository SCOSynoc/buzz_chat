import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CommonTextField extends StatefulWidget {

   final TextEditingController controller;
   final String labelText;
   final IconData? icon;
   final bool isPassword;
   final VoidCallback action;

   CommonTextField({super.key,
     required this.controller,
     required this.action,required this.labelText,
     required this.icon,required this.isPassword,});


  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _showPass ;


  @override
  void initState() {
    super.initState();
    _showPass = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {

    return  ListTile(
      title: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.labelText,
            prefixIcon: widget.icon != null ? Icon(widget.icon, color: Colors.yellowAccent,): null ,
            suffixIcon: widget.isPassword ? InkWell(
              splashColor: Colors.transparent,
                onTap: () {
                   setState(() {
                     _showPass = !_showPass;
                   });
                },
                child: Icon( _showPass ?  CupertinoIcons.eye_slash
                    : CupertinoIcons.eye_fill, color: Colors.yellowAccent,)) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          obscureText:_showPass,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget.labelText}';
            }
            return null;
          },
        ),
    );

  }
}



