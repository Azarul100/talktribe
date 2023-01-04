import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/login_page.dart';
import 'package:talktribe/pages/createprofile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talktribe/pages/newuser_page.dart';
import 'package:talktribe/database/database.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            //height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/TalkTribeLogo.png',
                        height: screenHeight * .2,
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
                    width: screenWidth,
                    height: screenHeight * .8,
                    //clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
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
                        boxShadow: [BoxShadow(color: Color(0xffE80606))]),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            textAlign: TextAlign.center,
                            '\nCreate an Account\n',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        // input for email address
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                borderRadius: BorderRadius.circular(30.0)),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .01,
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
                                borderRadius: BorderRadius.circular(30.0)),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Container(
                        // input for password
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: confirmpasswordController,
                          onChanged: ((value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          }),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      const Text(
                        '\n',
                      ),
                      _signUpButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "\n Already have an account? \n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Go to Sign Up Page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                                textAlign: TextAlign.center,
                                'SIGN IN',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),

                      /*SizedBox(
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

  _signUpButton() {
    return Container(
        // login button
        height: MediaQuery.of(context).size.height * .065,
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, shape: StadiumBorder()),
          child: const Text(
              textAlign: TextAlign.center,
              'Sign Up',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: () async {
            // Go to Sign Up Page

            if (password == confirmPassword) {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, password: password);
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  // user.updatePhotoURL(
                  //     "https://cdn-icons-png.flaticon.com/512/875/875610.png?w=1380&t=st=1669782706~exp=1669783306~hmac=d2fbb9f4a87bc173d827659962ea55563c2c028a924f9f7ba4eb29c9ce3faff9");
                  final userEmail = user.email;
                  postUser(userEmail);
                  _showMessage("You are now signed up with ${userEmail ?? ''}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfilePage()));
                }
              } on FirebaseAuthException catch (e) {
                switch (e.code) {
                  case "email-already-in-use":
                    _showMessage("Email is already in use");
                    break;
                  case "invalid-email":
                    _showMessage("Invalid email");
                    break;
                  case "weak-password":
                    _showMessage("Weak password. At least 6 characters");
                    break;
                }
              }
            } else {
              _showMessage("Passwords do not match");
            }
          },
        ));
  }
}
