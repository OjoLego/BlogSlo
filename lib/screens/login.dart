import 'package:blog_slo/common/widgets/d_bold_text.dart';
import 'package:blog_slo/common/widgets/d_sub_text.dart';
import 'package:blog_slo/screens/register.dart';
import 'package:blog_slo/util/constants.dart';
import 'package:flutter/material.dart';

import '../common/widgets/d_brand_name.dart';
import '../common/widgets/d_multicolored_string.dart';
import '../common/widgets/d_text_input_field.dart';
import '../services/auth_service.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _loading = false;

  void _loginUser() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true;
    });

    final response = await _authService.loginUser(
      _emailController.text,
      _passwordController.text,
    );

    if (response.containsKey('token')) {
      await _authService.saveToken(response['token']);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You do not have an account created. Creat account'),
          backgroundColor: Colors.blue,
        ),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Register(),
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
                    heading: TTexts.welcomeBack,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 8.0),

                const DSubText(
                  subHeading: TTexts.enterDetails,
                ),
                const SizedBox(height: 20.0 * 2),

                // Email text-field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: DSubText(
                    subHeading: TTexts.emailAddress,
                  ),
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
                  child: DSubText(subHeading: TTexts.password),
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

                const SizedBox(height: 8.0 / 2),

                // Remember Me and Forget Password row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            onChanged: (value) {},
                            activeColor: const Color(0xFF093D9F)),
                        const DSubText(subHeading: TTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const DSubText(subHeading: TTexts.forgetPassword),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _loginUser,
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
                            TTexts.login,
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
                  text1: TTexts.dontHaveAccount,
                  text2: TTexts.createAccount,
                  onText1Pressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Home()),
                      (route) => false,
                    );
                  },
                  onText2Pressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Register()),
                      (route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
