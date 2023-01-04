import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talktribe/database/database.dart';
import 'package:talktribe/widgets/appBar.dart';
import 'package:talktribe/widgets/bottomNavBar.dart';

class ProfilePage extends StatefulWidget {
  final String? value;
  ProfilePage({Key? key, this.value}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  final String? _email = FirebaseAuth.instance.currentUser?.displayName;
  final String _photoURL =
      FirebaseAuth.instance.currentUser?.photoURL ?? "assets/images/user.png";

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
          // Image.asset(
          //   'assets/images/TalkTribeLogo.png',
          //   height: screenHeight * .1,
          // ),
          AppBarWidget(),
          SizedBox(
            height: screenHeight * .03,
          ),
          Container(
              height: screenHeight * .5,
              width: screenWidth * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 220, 19, 19),
                      Color.fromARGB(255, 152, 5, 5)
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    ), //B
                  ]),
              //color: Colors.red,
              //FDFBFB
              child: Column(
                children: [
                  Flexible(
                      child: FutureBuilder(
                          future: getProfile(widget.value),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                        return Column(children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CircleAvatar(
                                              radius: screenHeight * .08,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    snapshot.data[index]
                                                                .profilePic !=
                                                            ""
                                                        ? snapshot.data[index]
                                                            .profilePic
                                                        : _photoURL),
                                                radius: screenHeight * .075,
                                              )
                                              //backgroundImage:
                                              //  NetworkImage('assets/images/TalkTribeLogo.png'),
                                              ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              //textAlign: TextAlign.center,
                                              snapshot.data[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 32.0),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * .025,
                                          ),
                                          Container(
                                            //height: screenHeight * .2,
                                            width: screenWidth * .7,
                                            child: Text(
                                              //textAlign: TextAlign.center,
                                              snapshot.data[index].bio,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      screenHeight * .025),
                                            ),
                                          )
                                        ]);
                                      });
                                }
                            }
                          }))
                ],
              )),
        ],
      ),
    ));
  }
}
