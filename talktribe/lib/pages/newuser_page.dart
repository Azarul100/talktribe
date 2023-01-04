//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/signup_page.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:postgres/postgres.dart';
import 'package:talktribe/database/database.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  _NewUserPage createState() => _NewUserPage();
}

class _NewUserPage extends State<NewUserPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    /*return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.red),
      home: CreateProfilePage(),
    );*/
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/TalkTribeLogo.png',
            height: screenHeight * .1,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
              textAlign: TextAlign.center,
              " Get started by joining the TalkTribe Group to begin your journey!",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 40,
          ),
          Container(
              height: screenHeight * .6,
              width: screenWidth * .8,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 220, 19, 19),
                      Color.fromARGB(255, 152, 5, 5)
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(color: Color.fromARGB(255, 220, 19, 19))
                  ]),
              //color: Colors.red,
              //FDFBFB
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "TalkTribe Group",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white, /*fontWeight: FontWeight.bold*/
                      )),
                  const SizedBox(
                    height: 0.05,
                  ),
                  Flexible(
                    child: FutureBuilder(
                      future: getName(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return new Center(
                                child: new CircularProgressIndicator());
                          case ConnectionState.waiting:
                            return new Center(
                                child: new CircularProgressIndicator());
                          case ConnectionState.active:
                            return new Center(
                                child: new CircularProgressIndicator());
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
                                      (BuildContext context, int index) {
                                    return Align(
                                        child: Container(
                                            height: screenHeight * .06,
                                            width: screenWidth * .75,
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                //borderRadius: BorderRadius.circular(30.0),
                                                boxShadow: const [
                                                  BoxShadow(color: Colors.white)
                                                ]),
                                            child: ListTile(
                                                title: Text(
                                                    //textAlign: TextAlign.center,
                                                    snapshot.data[index].name,
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenHeight * .025,
                                                      color: Colors
                                                          .black, /*fontWeight: FontWeight.bold*/
                                                    )),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              new ProfilePage(
                                                                  value: snapshot
                                                                      .data[
                                                                          index]
                                                                      .email)));
                                                })));
                                  });
                            }
                            ;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenHeight * .05,
                width: screenWidth * .5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 173, 18, 7),
                        shape: StadiumBorder()),
                    onPressed: (() {
                      updateTribe(1, FirebaseAuth.instance.currentUser?.email);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GroupPage()));
                    }),
                    child: Text(
                        textAlign: TextAlign.center,
                        "JOIN",
                        style: TextStyle(
                            fontSize: screenHeight * .019,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              )),
        ],
      ),
    ));
  }
}
