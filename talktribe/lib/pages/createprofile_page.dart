import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talktribe/pages/signup_page.dart';
import 'package:talktribe/pages/newuser_page.dart';
import 'package:talktribe/database/database.dart';

User? user = FirebaseAuth.instance.currentUser;
String? user_id = FirebaseAuth.instance.currentUser?.uid;
String? user_email = FirebaseAuth.instance.currentUser?.email;

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  _CreateProfilePage createState() => _CreateProfilePage();
}

class _CreateProfilePage extends State<CreateProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  html.File? _image;
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(
      bucket: 'gs://flutter-final-group.appspot.com');
  String _url = "";

  void _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      html.File? img = html.File(image.path);
      setState(() {
        _image = img;
        //Navigator.of(context).pop();
      });
      Reference ref = _storage.ref().child(image.path);
      UploadTask uploadTask = ref.putFile(img);
      uploadTask.whenComplete(() async {
        var url = await ref.getDownloadURL();
        setState(() {
          _url = url;
        });
      });
      _showMessage("Image stored");
    } on Exception catch (e) {
      print(e);
      //Navigator.of(context).pop();
      // TODO
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  String name = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const maxLines = 7;
    child:

    /*return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.red),
      home: CreateProfilePage(),
    );*/

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffE80606), Color.fromARGB(255, 152, 5, 5)])),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/TalkTribeLogo.png',
                  height: screenHeight * .1,
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    "Select your profile picture",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: screenHeight * .015,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    CircleAvatar(
                      backgroundImage: _image == null
                          ? NetworkImage('assets/images/user.png')
                          : FileImage(_image!)
                              as ImageProvider, //NetworkImage(_image),
                      radius: 40,
                      backgroundColor: Colors.white,
                      //backgroundImage:
                      //  NetworkImage('assets/images/TalkTribeLogo.png'),
                      //child: Text(textAlign: TextAlign.center, 'Test'),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * .01),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: _pickImage,
                    /*(() {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));*/
                      
                    }),*/
                    child: const Text(
                        textAlign: TextAlign.center,
                        "Choose",
                        style: TextStyle(fontSize: 20, color: Colors.black))),
                SizedBox(
                  height: screenHeight * .05,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    "What is your name?",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                //const SizedBox(height: .25),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: TextField(
                    controller: nameController,
                    onChanged: (value) => name = value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Enter Name',
                    ),
                  ),
                ),
                /*TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 3.0),
                        borderRadius: BorderRadius.circular(30.0)),
                    labelText: 'Enter Name',
                  ),
                ),*/
                SizedBox(height: screenHeight * .05),
                const Text(
                    textAlign: TextAlign.center,
                    "Write a bio",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: screenHeight * .0025,
                ),
                /*TextFormField(
                  controller: bioController,
                  decoration: InputDecoration(
                    //contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    isDense: true, // Added this
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 3.0),
                        borderRadius: BorderRadius.circular(30.0)),
                    labelText: 'Type something...',
                  ),
                ),*/
                Container(
                  margin: const EdgeInsets.all(12),
                  height: maxLines * 24.0,
                  child: TextField(
                    controller: bioController,
                    maxLines: maxLines,
                    decoration: InputDecoration(
                        labelText: "Enter a bio",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(

                            //borderRadius: BorderRadius.circular(30,0)
                            )),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Container(
                  //height: screenHeight * .05,
                  width: screenWidth * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, shape: StadiumBorder()),
                    child: const Text(
                        textAlign: TextAlign.center,
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    onPressed: () async {
                      // Go to Sign Up Page
                      if (name == "") {
                        _showMessage("You must fill out a name");
                      } else {
                        FirebaseAuth.instance.currentUser
                            ?.updateDisplayName(name);
                        if (_url != "") {
                          FirebaseAuth.instance.currentUser
                              ?.updatePhotoURL(_url);
                        }
                        updateUser(
                            name,
                            bioController.text,
                            _url != "" ? _url : "",
                            FirebaseAuth.instance.currentUser?.email);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewUserPage()));
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
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
