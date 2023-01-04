import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/users_page.dart';
import 'package:talktribe/database/database.dart';
import 'package:talktribe/widgets/appBar.dart';

String? user = user_email;

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  _WritePage createState() => _WritePage();
}

class _WritePage extends State<WritePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(
          children: [
            /*Image.asset(
              'assets/images/TalkTribeLogo.png',
              height: screenHeight * .1,
            ),*/
            AppBarWidget(),
            SizedBox(
              height: screenHeight * .05,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UsersPage()));
              }),
              child: const Align(
                alignment: Alignment(-.85, .5),
                child: Chip(
                    backgroundColor: Color.fromARGB(255, 220, 19, 19),
                    label: Text('TalkTribe Group'),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight * .01,
            ),
            Container(
              height: screenHeight * .45,
              width: screenWidth * .9,
              padding: EdgeInsets.all(12),
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
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  const Text("Write your message",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: screenHeight * .05,
                  ),
                  Container(
                    height: screenHeight * .3,
                    child: TextField(
                      controller: mainController,
                      keyboardType: TextInputType.multiline,
                      maxLength: 280,
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'I think that...',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * .005,
            ),
            Align(
              alignment: Alignment(.85, .5),
              child: FloatingActionButton(
                //TODO: MAKE ONPRESSED GO TO GROUP PAGE
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupPage()));
                  if (mainController.text != "") {
                    postMessage(1, mainController.text,
                        FirebaseAuth.instance.currentUser?.email);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GroupPage()));
                  } else {
                    _showMessage("You must fill out a message to submit");
                  }
                },
                backgroundColor: Color.fromARGB(255, 159, 6, 6),
                child: Icon(
                  Icons.send,
                ),
              ),
            ),
          ],
        )));
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
}
