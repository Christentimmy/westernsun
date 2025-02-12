import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/models/retreive_model.dart';

class Retrieve extends GetxController {
  final userDetails = Rx<RetrieveModel?>(null);
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _userStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    //userDetails.value = null;
    _userStreamSubscription = fetchUserDetails();
  }

  fetchUserDetails() {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots()
          .listen((DocumentSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.exists) {
          RetrieveModel user = RetrieveModel(
            email: snapshot.get("email"),
            username: snapshot.get("username"),
            phoneNumber: snapshot.get("phoneNumber"),
            image: snapshot.get('image'),
          );
          userDetails.value = user;
        }
      });
    } catch (e) {
      debugPrint('Error fetching user details: $e');
    }
  }

  @override
  void dispose() {
    _userStreamSubscription
        ?.cancel(); // Cancel the stream subscription when the controller is disposed
    super.dispose();
  }
}