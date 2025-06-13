import 'package:cricketmania/utils/routes/routes_name.dart';
import 'package:cricketmania/utils/utils.dart';
import 'package:cricketmania/view_model/account_services/account_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cricketmania/resources/colors.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AccountServices>(context, listen: false);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      Utils.snackBar("Google Sign-In failed: \$e", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.black,
        ),
        body: Consumer<AccountServices>(builder: (context, value, child) {
          return value.user == null
              ? SingleChildScrollView(
                  child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.1),
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Login to CricketMania",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          TextFormField(
                            style: const TextStyle(color: AppColors.white),
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: const TextStyle(
                                color: AppColors.white,
                              ),
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.yellow),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!value.contains("@")) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                            cursorColor: AppColors.yellow,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            style: const TextStyle(color: AppColors.white),
                            controller: _passwordController,
                            obscureText: value.obscureText,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: AppColors.white,
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              suffix: IconButton(
                                  onPressed: () {
                                    value.setObscureText();
                                  },
                                  icon: Icon(value.obscureText == false
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.yellow),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                            cursorColor: AppColors.yellow,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.forgotPasswordScreen);
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                _auth
                                    .signInWithCredential(
                                  EmailAuthProvider.credential(
                                      email: _emailController.text,
                                      password: _passwordController.text),
                                )
                                    .then((value) {
                                  Utils.snackBar(
                                      value.user!.email.toString(), context);
                                }).onError(
                                  (error, stackTrace) {
                                    Utils.snackBar(error.toString(), context);
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: AppColors.yellow,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.2,
                                vertical: screenHeight * 0.015,
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _signInWithGoogle();
                            },
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
                                const SizedBox(width: 5),
                                const Text(
                                  "Continue With Google",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? ",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.signUpScreen);
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "You are already logged in",
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            _auth.signOut();
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                );
        }));
  }
}
