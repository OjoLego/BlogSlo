import 'package:blog_slo/common/widgets/d_brand_name.dart';
import 'package:blog_slo/common/widgets/d_bold_text.dart';
import 'package:blog_slo/common/widgets/d_sub_text.dart';
import 'package:blog_slo/screens/login.dart';
import 'package:blog_slo/util/constants.dart';
import 'package:flutter/material.dart';

import '../common/widgets/d_multicolored_string.dart';
import '../common/widgets/d_text_input_field.dart';
import '../services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _loading = false;

  void _registerUser() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true;
    });

    final response = await _authService.registerUser(
      _fullNameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (response.containsKey('token')) {
      await _authService.saveToken(response['token']);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to register. Please try again.'),
          backgroundColor: Colors.blue,
        ),
      );
    }

    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0 * 2),
                  const DBrandName(),
                  const SizedBox(height: 16.0),
                  const DBoldText(
                      heading: TTexts.createAccount,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 8.0),
                  const DSubText(
                      subHeading: TTexts.enterDetails,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 20.0 * 2),

                  // Full Name text-field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: DSubText(subHeading: TTexts.fullName),
                  ),
                  DTextInputField(
                    keyboardType: TextInputType.name,
                    controller: _fullNameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return TTexts.nameRequired;
                      }
                      return null;
                    },
                    hintText: TTexts.enterFullName,
                    obscureText: false, // Not obscuring text in this field
                  ),

                  const SizedBox(height: 8.0),

                  // Email text-field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: DSubText(subHeading: TTexts.emailAddress),
                  ),
                  DTextInputField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return TTexts.emailRequired;
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return TTexts.invalidEmail;
                      }
                      return null;
                    },
                    hintText: TTexts.enterEmail,
                    obscureText: false,
                  ),
                  const SizedBox(height: 8.0),

                  // Password text-field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: DSubText(subHeading: TTexts.createPassword),
                  ),
                  DTextInputField(
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    hintText: TTexts.enterPassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return TTexts.passwordRequired;
                      } else if (val.length < 6) {
                        return TTexts.passwordLeastChar;
                      }
                      return null;
                    },
                    obscureText: true,
                    showVisibilityIcon: true,
                  ),
                  const SizedBox(height: 8.0),

                  // Confirm text-field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: DSubText(subHeading: TTexts.confirmPassword),
                  ),
                  DTextInputField(
                    keyboardType: TextInputType.text,
                    controller: _confirmPasswordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return TTexts.passwordRequired;
                      } else if (val != _passwordController.text) {
                        return TTexts.passwordsDontMatch;
                      }
                      return null;
                    },
                    hintText: TTexts.enterPassword,
                    showVisibilityIcon: true,
                    obscureText: true,
                  ),

                  const SizedBox(height: 20.0),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF093D9F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              TTexts.register,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 8.0 / 2),

                  // Create account button
                  DMulticoloredString(
                    text1: TTexts.alreadyHaveAccount,
                    text2: TTexts.login,
                    onText1Pressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false,
                      );
                    },
                    onText2Pressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false,
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
