import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talktribe/database/database.dart';
import 'package:postgres/postgres.dart';

Widget message(String doc) {
  return InkWell(
    child: Container(
      //padding: EdgeInsets.all(8.0),
      //margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromARGB(255, 220, 19, 19),
            Color.fromARGB(255, 152, 5, 5)
          ],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc,
              style: TextStyle(
                fontSize: 85,
                color: Colors.black, /*fontWeight: FontWeight.bold*/
              )),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}
