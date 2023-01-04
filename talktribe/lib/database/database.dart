import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/signup_page.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:postgres/postgres.dart';
import 'package:talktribe/pages/newuser_page.dart';
import 'package:http/http.dart' as http;

Future<void> getUsers() async {
  var url = Uri.parse('https://test-xtdvbemskq-uc.a.run.app/');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> postMessage(tribe, message, email) async {
  var url = Uri.parse('https://postnote-xtdvbemskq-uc.a.run.app');
  var response = await http.post(url, body: {
    'tribeID': tribe.toString(),
    'message': message,
    'email': email,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> postUser(email) async {
  var url = Uri.parse('https://postuser-xtdvbemskq-uc.a.run.app');
  var response = await http.post(url, body: {
    'email': email,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> updateUser(name, bio, profilePic, email) async {
  var url = Uri.parse('https://updateuser-xtdvbemskq-uc.a.run.app');
  var response = await http.put(url, body: {
    'name': name,
    'bio': bio,
    'profilePic': profilePic,
    'email': email,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> updateTribe(tribeID, email) async {
  var url = Uri.parse('https://updatetribe-xtdvbemskq-uc.a.run.app');
  var response = await http.put(url, body: {
    'tribeID': tribeID.toString(),
    'email': email,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<List<Username>> getName() async {
  var url = Uri.parse('https://getnames-xtdvbemskq-uc.a.run.app');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  var jsonData = jsonDecode(response.body);
  List<Username> users = [];
  for (var u in jsonData) {
    Username user = Username(u["email"], u["name"]);
    users.add(user);
  }
  print(users.length);
  return users;
}

Future<List<Message>> getMessage() async {
  var url = Uri.parse('https://getmessage-xtdvbemskq-uc.a.run.app');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  var jsonData = jsonDecode(response.body);
  List<Message> messages = [];
  for (var u in jsonData) {
    Message mess = Message(u["message"], u["name"]);
    messages.add(mess);
  }
  print(messages.length);
  return messages;
}

Future<List<Profile>> getProfile(email) async {
  var url = Uri.parse('https://getprofile-xtdvbemskq-uc.a.run.app');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  var jsonData = jsonDecode(response.body);
  List<Profile> profiles = [];
  for (var u in jsonData) {
    if (u["email"] == email) {
      Profile profile =
          Profile(u["email"], u["name"], u["bio"], u["profilePic"]);
      profiles.add(profile);
    }
  }
  print(profiles.length);
  return profiles;
}

class Username {
  final String email;
  final String name;
  Username(this.email, this.name);
}

class Message {
  final String message;
  final String name;
  Message(this.message, this.name);
}

class Profile {
  final String email;
  final String name;
  final String bio;
  final String profilePic;
  Profile(this.email, this.name, this.bio, this.profilePic);
}
