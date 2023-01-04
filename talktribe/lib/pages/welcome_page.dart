import 'package:flutter/material.dart';
import 'package:talktribe/pages/login_page.dart';
import 'package:talktribe/pages/signup_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFF5858), Color(0xffBB0000)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/TalkTribeLogo.png",
                height: screenHeight * .2,
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  "Connect with others to talk about anything"),
              SizedBox(
                height: screenHeight * .1,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  "Join the tribe today"),
              SizedBox(
                height: screenHeight * .1,
              ),
              Container(
                //height: screenHeight * .5,
                //width: screenWidth * .8,
                //padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * .075,
                      width: screenWidth * .5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //minimumSize: const Size(200, 70),
                          //maximumSize: const Size(400, 100),

                          primary: Colors.white,
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'LOGIN',
                          style: TextStyle(fontSize: 27, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => LoginPage()),
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .1,
                    ),
                    Container(
                      //height: screenHeight * .5,
                      // width: screenWidth * .8,
                      //padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: screenHeight * .075,
                            width: screenWidth * .5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //minimumSize: const Size(200, 70),
                                //maximumSize: const Size(400, 100),

                                primary: Colors.white,
                              ),
                              child: const Text(
                                textAlign: TextAlign.center,
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 27, color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => SignUpPage()),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              /*const SizedBox(
                height: 50,
              ),*/
              /*Container(
                //height: screenHeight * .5,
                // width: screenWidth * .8,
                //padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * .075,
                      width: screenWidth * .5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //minimumSize: const Size(200, 70),
                          //maximumSize: const Size(400, 100),
                          side: const BorderSide(
                            width: 4.0,
                            color: Colors.black,
                          ),
                          primary: Colors.white,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => SignUpPage()),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              )*/
            ],
          ),
        ),
      ),
    )

        // return Scaffold(
        //   body: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Image.asset("assets/images/TalkTribeLogo.png",
        //         height: screenHeight * .2,),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Text(
        //           "Create and join groups to talk with others of similar intrests. ",
        //          style: TextStyle(fontSize: 25),
        //         ),
        //         Text(
        //           "Find your tribe today",
        //           style: TextStyle(fontSize: 25),
        //           ),
        //         Container(
        //                 height: 200,
        //                 width: 450,
        //                 padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                 ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       side: BorderSide(
        //                         width: 2.0,
        //                         color: Colors.black,
        //                       ),
        //                       primary: Colors.white,
        //                       ),
        //                   child: const Text('login',
        //                       style: TextStyle(fontSize: 20, color: Colors.black)),
        //                   onPressed: () {
        //                     // Go to Sign Up Page
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => LoginPage()));
        //                   },
        //                 )
        //                 ],),

        //                 ),
        //                 Container(
        //                    height: 300,
        //                 width: 450,
        //                 padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                 ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       side: BorderSide(
        //                         width: 2.0,
        //                         color: Colors.black,
        //                       ),
        //                       primary: Colors.white,
        //                       ),
        //                   child: const Text('Sign Up',
        //                       style: TextStyle(fontSize: 20, color: Colors.black)),
        //                   onPressed: () {
        //                     // Go to Sign Up Page
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => SignUpPage()));
        //                   },
        //                 )
        //                 ],),

        //                 )

        //         /*Column(
        //           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           //mainAxisSize: MainAxisSize.max,
        //           children: <Widget>[
        //             Align(
        //               alignment: Alignment.bottomCenter,
        //               child: Image.asset(
        //                   'assets/images/TalkTribeLogo.png',
        //                   height: screenHeight * .3,
        //                 )
        //             )
        //           ],
        //         )*/
        //       ],
        //     )
        //   ),
        // )
        ;
  }
}
