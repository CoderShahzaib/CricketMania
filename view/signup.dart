import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/utils/utils.dart';
import 'package:cricketmania/view_model/account_services/account_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: AppColors.black,
      ),
      body: Consumer<AccountServices>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Create your new account",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Enter Full Name",
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        cursorColor: AppColors.yellow,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter full name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        cursorColor: AppColors.yellow,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter email address";
                          } else if (!value.contains("@")) {
                            return "Enter valid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffix: IconButton(
                              onPressed: () {
                                value.setObscureText();
                              },
                              icon: Icon(value.obscureText == false
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        cursorColor: AppColors.yellow,
                        obscureText: value.obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          } else if (value.length < 8) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: "Retype Password",
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffix: IconButton(
                              onPressed: () {
                                value.setObscureText();
                              },
                              icon: Icon(value.obscureText == false
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        cursorColor: AppColors.yellow,
                        obscureText: value.obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          } else if (value.length < 8) {
                            return "Password must be at least 6 characters";
                          } else if (value != _passwordController.text) {
                            return "Typed correct password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            Utils.snackBar(
                                value.user!.email.toString(), context);
                          }).onError((error, stackTrace) {
                            Utils.snackBar(error.toString(), context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.2,
                              vertical: screenHeight * 0.015),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppColors.yellow,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.15,
                              vertical: screenHeight * 0.015),
                          backgroundColor: AppColors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/pngwing.com.png",
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Register With Google",
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      )
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }
}
