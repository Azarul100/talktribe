import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:talktribe/pages/signup_page.dart';
import 'package:talktribe/pages/users_page.dart';
import 'package:talktribe/widgets/appBar.dart';
import 'package:talktribe/widgets/bottomNavBar.dart';
import 'package:talktribe/widgets/message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talktribe/pages/login_page.dart';
import 'package:talktribe/pages/write_page.dart';
import 'package:postgres/postgres.dart';
import 'package:talktribe/database/database.dart';
import 'package:talktribe/widgets/AppBar.dart' as AppBar;

User? user = FirebaseAuth.instance.currentUser;
String? user_id = FirebaseAuth.instance.currentUser?.uid;
String? user_email = FirebaseAuth.instance.currentUser?.email;

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  _GroupPage createState() => _GroupPage();
}

class _GroupPage extends State<GroupPage> {
  // bool value = false;

  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(FirebaseAuth.instance.currentUser?.displayName);
    print(user?.email);

    return Scaffold(
        //appBar: AppBarWidget(),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 228, 119, 119),
          child: Icon(Icons.chat_rounded),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WritePage()));
          },
        ),
        body: FutureBuilder(
            future: getMessage(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Center(
                child: Column(children: [
                  AppBarWidget(),
                  /*Image.asset(
              'assets/images/TalkTribeLogo.png',
              height: screenHeight * .1,
            ),*/
                  SizedBox(
                    height: screenHeight * .03,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UsersPage()));
                    },
                    child: const Chip(
                      backgroundColor: Color.fromARGB(255, 220, 19, 19),
                      label: Text('TalkTribe Group'),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * .65,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                        //borderRadius: BorderRadius.circular(30.0),
                        //boxShadow: [BoxShadow(color: Colors.white)]
                      ),
                      child: Column(
                        children: [
                          Flexible(
                              child: FutureBuilder(
                                  future: getMessage(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        return new Center(
                                            child:
                                                new CircularProgressIndicator());
                                      case ConnectionState.waiting:
                                        return new Center(
                                            child:
                                                new CircularProgressIndicator());
                                      case ConnectionState.active:
                                        return new Center(
                                            child:
                                                new CircularProgressIndicator());
                                      case ConnectionState.done:
                                        if (snapshot.hasError) {
                                          return new Text(
                                            '${snapshot.error}',
                                            style: TextStyle(color: Colors.red),
                                          );
                                        } else {
                                          return ListView.builder(
                                              itemCount: snapshot.data.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Align(
                                                    child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                minHeight:
                                                                    screenHeight *
                                                                        .15),
                                                        width: screenWidth * .8,
                                                        margin: const EdgeInsets
                                                            .only(bottom: 10),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 10, 0, 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          //borderRadius: BorderRadius.circular(30.0),
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              Color.fromARGB(
                                                                  255,
                                                                  220,
                                                                  19,
                                                                  19),
                                                              Color.fromARGB(
                                                                  255,
                                                                  152,
                                                                  5,
                                                                  5)
                                                            ],
                                                          ),
                                                        ),
                                                        child: ListTile(
                                                          title: Text(
                                                              //textAlign: TextAlign.center,
                                                              snapshot
                                                                  .data[index]
                                                                  .name,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    screenHeight *
                                                                        .03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white, /*fontWeight: FontWeight.bold*/
                                                              )),
                                                          subtitle: Text(
                                                            snapshot.data[index]
                                                                .message,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  screenHeight *
                                                                      .02,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )));
                                              });
                                        }
                                        ;
                                    }
                                  })),
                          /*
                Expanded(
                  
                
                          return Text("No message",
                              style: GoogleFonts.nunito(
                                color: Colors.black,
                              ));
                        })) */
                        ],
                      )),
                  //SizedBox(height: screenHeight * .01),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         side: BorderSide(
                  //           width: 5.0,
                  //           color: Colors.black,
                  //         ),
                  //         primary: Colors.white,
                  //         shape: StadiumBorder()),
                  //     child: const Text(
                  //         textAlign: TextAlign.center,
                  //         'Sign Up',
                  //         style: TextStyle(fontSize: 20, color: Colors.black)),
                  //     onPressed: () {
                  //       FirebaseAuth.instance.signOut();
                  //     }),

                  //const SizedBox(  height: 10,),
                ]),
              );
            }));
  }
}
