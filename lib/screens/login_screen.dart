import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/utils/utils.dart';
import 'package:buzz_chat/widgets/common_button.dart';
import 'package:buzz_chat/widgets/common_textfield.dart';
import 'package:buzz_chat/widgets/loading_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/AuthBlocs/auth_events.dart';
import '../utils/validation.dart';
import 'Dashboard_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthStates>(
      listener: (context,state) {
           if(state is AuthLoading) {
              isLoading = state.loading;
           }

           if(state is SignInSuccess) {
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                     (Route<dynamic> route) => false);
           }

           if(state is SignInFailure) {
             showSnackBar(context: context, content: "Something went wrong");
           }
      },
      builder: (context, state) {
        return LoadingManager(
          isLoading: isLoading,
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width > 700 ? 650 : MediaQuery.of(context).size.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      CommonTextField(controller: _emailController, action: () {}, labelText: "Email", icon: Icons.email, isPassword: false),
                      SizedBox(height: 16,),
                      CommonTextField(controller: _passwordController, action: () {}, labelText: "Password", icon: Icons.password, isPassword: true),
                      SizedBox(height: 20,),
                      CommonButton(onTap: (){
                        Validate( email: _emailController.text,
                            password: _passwordController.text).commonFunction(context);
                        if (_formKey.currentState!.validate()) {
                          // Perform signup
                          context.read<AuthBloc>().add(
                              SignInRequested(email: _emailController.text,
                                  password: _passwordController.text,)
                          );
                        }
                      }, buttonText: "Sign in")
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
