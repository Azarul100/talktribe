import 'package:flutter/material.dart';
import 'package:talktribe/pages/welcome_page.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:talktribe/database/database.dart';
import 'package:talktribe/widgets/appBar.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  _UsersPage createState() => _UsersPage();
}

class _UsersPage extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const maxLines = 7;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /*Image.asset(
              "assets/images/TalkTribeLogo.png",
              height: screenHeight * .15,
            ),*/
            AppBarWidget(),
            SizedBox(
              height: screenHeight * .02,
            ),
            Container(
              height: screenHeight * .7,
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "TalkTribe Group Members",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                                itemBuilder: (BuildContext context, int index) {
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
                                                                    .data[index]
                                                                    .email)));
                                              })));
                                });
                          }
                      }
                    },
                  )),
                ],
              ),
            ),
//           InkWell(
//     child: Container(
//           height: screenHeight * .7,
//           width:  screenWidth * .7,
//           decoration: BoxDecoration(
//             color: Colors.black,
//           ),
//     ),
//     onTap: () {
//         print("Tapped on container");
//     },
// )
          ],
        ),
      ),
    );
  }
}
