import 'package:flutter/material.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talktribe/pages/welcome_page.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidget();
}

class _AppBarWidget extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      centerTitle: true,
      title: Align(
          child: Image.asset(
        'assets/images/TalkTribeLogo.png',
        height: screenHeight * .1,
      )),
      actions: [
        DropdownButton(
          items: const [
            DropdownMenuItem(
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              value: "Home",
            ),
            DropdownMenuItem(
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                value: "Profile"),
            DropdownMenuItem(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                value: "Logout"),
          ],
          onChanged: (option) async {
            Widget widget;
            if (option == "Home") {
              //Go to edit screen
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => GroupPage())));
            } else if (option == "Profile") {
              //Go to Delete screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProfilePage(
                          value: FirebaseAuth.instance.currentUser?.email,
                        )),
                  ));
            } else if (option == "Logout") {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => WelcomePage()),
                  ));
            }
          },
          iconEnabledColor: Color.fromARGB(255, 220, 19, 19),
          iconSize: 40,
          icon: Icon(Icons.account_circle_rounded),
          elevation: 0,
          underline: const SizedBox(),
          dropdownColor: Color.fromARGB(255, 220, 19, 19),
          alignment: AlignmentDirectional.bottomStart,
          //itemHeight: 75,

          //isExpanded: true,
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
