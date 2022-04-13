import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamicapp/authentications/landing_scr.dart';
import 'package:islamicapp/authentications/providers/models/add_commit.dart';
import 'package:islamicapp/authentications/providers/models/add_qari_feed_model.dart';
import 'package:islamicapp/authentications/providers/usermodel.dart';

import '../../qibla_direction/flutter_qiblah.dart';

class DataBaseMethods {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap = await _firestore
        .collection('user')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return UserModel.fromSnapshot(snap);
  }

  Future<String> registerUser(
      {required String email,
      required String password,
      required String username,
      String? address,
      String res = "Some Error Occured"}) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
          email: email,
          uid: cred.user!.uid,
          username: username,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJSon(),
            );
        return res = 'added successfully';
      }
    } catch (e) {
      return res = e.toString();
    }
    return res;

    // _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
  }

  Future<String> UpdateUser({
    required String email,
    required String password,
    required String username,
    required String? id,
    String res = "Some Error Occured",
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserModel user = UserModel(
          email: email,
          uid: id,
          username: username,
        );

        await _firestore.collection('users').doc(id).update(
              user.toJSon(),
            );
        return res = 'updated successfully';
      }
    } catch (e) {
      return res = e.toString();
    }
    return res;

    // _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
  }

  Future loginUser(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String> resetPawwordUser({String? email}) async {
    String res = "email sent";

    try {
      _firebaseAuth.sendPasswordResetEmail(email: email!);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

//Rout for LogOut
  Route<void> _myRouteBuilder(BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => LandingScreen(),
    );
  }

  singnOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.of(context).restorablePush(
        (context, arguments) => _myRouteBuilder(context, arguments));
  }

  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
  ) async {
    Reference ref =
        _firebaseStorage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadImage(
      {required String title, required Uint8List file}) async {
    String res = 'Some error occured.';
    try {
      if (title.isNotEmpty || file != null) {
        String photoUrl = await uploadImageToStorage(
          'Communities',
          file,
        );

        AddCommit commit = AddCommit(
          title: title,
          uid: _auth.currentUser!.uid,
          photoUrl: photoUrl,
        );

        _firestore.collection('communities').doc().set(
              commit.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> uploadMosque(
      {required String mosque,
      required String qari,
      required String location}) async {
    String res = 'Some error occured.';
    try {
      if (mosque.isNotEmpty || qari.isNotEmpty || location.isNotEmpty) {
        // final locationStatus = await FlutterQiblah.checkLocationStatus();
        // if (locationStatus.enabled) {
        //   var position = await Geolocator.getCurrentPosition();

        AddQariFeedModel qariFeed = AddQariFeedModel(
          location: location,
          mosqueName: mosque,
          qariName: qari,
          // locationCo_ordinate: position,
        );

        _firestore.collection('QariMosqueFeed').doc().set(
              qariFeed.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
