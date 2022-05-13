import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';

import '../mainpage/widgets/bottom_drawee.dart';
import 'LogInPage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F0404),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icon.svg',
                      width: 130,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Visibility(
                      visible: false,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Please enter your email and password to use the app",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 15, color: Colors.red),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        )),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 15, color: Colors.red),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        )),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 15, color: Colors.red),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff8F2C2C),
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () async {
                    if (check()) {
                      setState(() {
                        _isLoading = true;
                      });
                      String res = await DataBaseMethods().registerUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        username: _nameController.text,
                      );

                      setState(() {
                        _isLoading = false;
                      });

                      if (res == "added successfully") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => MainScreen()),
                          ),
                        );
                      } else {
                        showAlertDialog(context, "Error: $res");
                      }
                    }
                  },
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator())
                      : const Text('Signup',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "  Login",
                        style:
                            TextStyle(color: Color(0xff0085FF), fontSize: 13),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  check() {
    if (_nameController.text.isEmpty) {
      showAlertDialog(context, "Name required");
      return false;
    }

    if (_emailController.text.isEmpty) {
      showAlertDialog(context, "Email required");
      return false;
    }

    if (_passwordController.text.isEmpty) {
      showAlertDialog(context, "Password required");
      return false;
    }

    return true;
  }
}
