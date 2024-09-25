import 'package:buzz_chat/blocs/AuthBlocs/auth_bloc.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_events.dart';
import 'package:buzz_chat/blocs/AuthBlocs/auth_states.dart';
import 'package:buzz_chat/utils/validation.dart';
import 'package:buzz_chat/widgets/common_textfield.dart';
import 'package:buzz_chat/widgets/gender_radio.dart';
import 'package:buzz_chat/widgets/loading_manager.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';
import 'Dashboard_Screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _gender = 'Male';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthStates>(
      listener: (context,state) {
        if(state is AuthLoading) {
          isLoading = state.loading;
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
        }

        if(state is SignUpSuccess) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  (Route<dynamic> route) => false);
        }

        if(state is SignUpFailure) {
          showSnackBar(context: context, content: "Something went wrong");
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isLoading: isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width > 600 ? 700: MediaQuery.of(context).size.width  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        CommonTextField(
                          controller: _nameController,
                          labelText: 'Name',
                          icon: Icons.person,
                          action: (){}, isPassword: false,),
                        const SizedBox(height: 16),
                        CommonTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          icon: Icons.mail,
                          action: (){}, isPassword: false,),
                        const SizedBox(height: 16),
                        CommonTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          icon: Icons.password,
                          action: (){}, isPassword: true,),
                        const SizedBox(height: 16),
                        const Text('Select a Gender', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GenderSelectors(gender: _gender),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.height*0.35,
                            child: ElevatedButton(
                              onPressed: () {

                                Validate(name: _nameController.text, email: _emailController.text,
                                    password: _passwordController.text)
                                    .commonFunction(context);

                                if (_formKey.currentState!.validate()) {
                                  // Perform signup
                                  context.read<AuthBloc>().add(
                                      SignUpRequested(email: _emailController.text,
                                      name: _nameController.text, password: _passwordController.text, gender: genderNotify.value)
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Signup',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
