import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talktribe/pages/createprofile_page.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/newuser_page.dart';
import 'package:talktribe/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../database/database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/TalkTribeLogo.png',
                      height: screenHeight * 0.2,
                    ),
                  ),
                ],
              ),
              //Image.asset('assets/images/TalkTribeLogo.png'),
              Column(children: <Widget>[
                /*SizedBox(
                  height: screenHeight * 0.2,
                ),*/
                //Expanded(child: Container())
                Container(
                  height: screenHeight * 0.8,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffE80606),
                          Color.fromARGB(255, 152, 5, 5),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 0,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      boxShadow: const [BoxShadow(color: Color(0xffE80606))]),
                  child: Column(children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          textAlign: TextAlign.center,
                          '\nSign In\n',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      // input for email address
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        onChanged: ((value) {
                          setState(() {
                            email = value;
                          });
                        }),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      // input for password
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: ((value) {
                          setState(() {
                            password = value;
                          });
                        }),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .05,
                    ),
                    _signInButton(),
                    SizedBox(
                      height: screenHeight * .025,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: const FaIcon(FontAwesomeIcons.google),
                          color: Colors.blue,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            try {
                              // var id = "";

                              // if (kIsWeb) {
                              //   id =
                              //       "589568007478-rutlmiqgjek2rsrla5brrgie105hcgp5.apps.googleusercontent.com";
                              // } else {
                              //   id =
                              //       "com.googleusercontent.apps.589568007478-eofkd3k6g11b2onns8hg834743nsosmn";
                              // }

                              final GoogleSignIn googleSignIn = GoogleSignIn(
                                  serverClientId:
                                      "589568007478-rutlmiqgjek2rsrla5brrgie105hcgp5.apps.googleusercontent.com");

                              final user = await googleSignIn.signIn();
                              final GoogleSignInAuthentication googleAuth =
                                  await user!.authentication;
                              final AuthCredential credential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleAuth.accessToken,
                                idToken: googleAuth.idToken,
                              );
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);

                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((User? user) {
                                if (user != null) {
                                  if ((user.metadata.creationTime!
                                              .difference(DateTime.now())
                                              .inSeconds)
                                          .abs() <
                                      10) {
                                    postUser(FirebaseAuth
                                        .instance.currentUser?.email);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateProfilePage()));
                                    _showMessage(
                                        "Created google account with ${user.email}");
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GroupPage()));
                                    _showMessage("Welcome back, ${user.email}");
                                  }
                                }
                              });
                            } on FirebaseAuthException catch (e) {
                              _showMessage(e.toString());
                            }
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "\n Don't have an account? \n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                              textAlign: TextAlign.center,
                              'SIGN UP',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          onTap: () {
                            // Go to Sign Up Page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                        )
                      ],
                    ),

                    /*const SizedBox(
                      height: 50,
                    )*/
                    // GOOGLE SIGN IN
                    // Container(
                    //     height: 50,
                    //     width: 150,
                    //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //     child: ElevatedButton(
                    //       style:
                    //           ElevatedButton.styleFrom(primary: Colors.black),
                    //       child: const Text('Sign in with Google',
                    //           style: TextStyle(
                    //               fontSize: 20, color: Color(0xffFFF69E))),
                    //       onPressed: () async {
                    //         // Go to Sign Up Page
                    //         await signInWithGoogle().then((value) {
                    //           //print("${value.user!.email} has logged in");
                    //           Navigator.pushReplacement(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     const MyHomePage(title: 'OnMyMind')),
                    //           );
                    //         }).catchError(
                    //           (e) => AlertDialog(
                    //             title: const Text('Error'),
                    //             content: Text(e.toString()),
                    //           ),
                    //         );
                    //       },
                    //     )),
                  ]),
                )
              ]),
            ],
          ),
        ));
  }

  _showMessage(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ?? ""),
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      behavior: SnackBarBehavior.floating,
      width: MediaQuery.of(context).size.width * 0.8,
    ));
  }

  _signInButton() {
    return Container(
        // login button
        height: MediaQuery.of(context).size.height * .065,
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, shape: StadiumBorder()),
          child: const Text('SIGN IN',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: () async {
            try {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password);
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                final userEmail = user.email;
                _showMessage("You are logged in ${userEmail ?? ''}");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GroupPage()));
              }
            } on FirebaseAuthException catch (e) {
              switch (e.code) {
                case "invalid-email":
                  _showMessage("Invalid email");
                  break;
                case "internal-error":
                  _showMessage("You must fill out all fields");
                  break;
                case "wrong-password":
                  _showMessage("Password is incorrect");
                  break;
              }
              print(e);
            }
          },
        ));
  }
}
