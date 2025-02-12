import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/controller/retreive_controller.dart';
import 'package:westernsun/models/user_model.dart';
import 'package:westernsun/screens/bottom_navigation.dart';
import 'package:westernsun/widgets/snack_bar.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final _retreiveController = Get.put(Retrieve());

  Future<void> createAccount({
    required String email,
    required String password,
    required int phoneNumber,
    required String userName,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      UserCredential users =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userData = UserModel(
        email: email,
        username: userName,
        password: password,
        phoneNumber: phoneNumber,
        uid: users.user!.uid,
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(users.user!.uid)
          .set(userData.toMap());
      debugPrint("firebase done");
      await _retreiveController.fetchUserDetails();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        CustomSnackbar.showError(
            "Message", "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        CustomSnackbar.showError("Message", "email-already-in-use");
      } else {
        debugPrint('Error creating user: ${e.message}');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
      stopwatch.stop();
      print("Time Taken to create user account: ${stopwatch.elapsed}");
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _retreiveController.fetchUserDetails();
      Get.offAll(() => BottomNavigationScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        CustomSnackbar.show(
          "Message",
          "The supplied auth credential is incorrect",
        );
      }
    } catch (e) {
      CustomSnackbar.show("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOTP(String email) async {
    try {
      EmailOTP.config(
        appEmail: "timmychris09@gmail.com",
        appName: "Email OTP",
        otpLength: 4,
        otpType: OTPType.numeric,
      );

      if (await EmailOTP.sendOTP(email: email) == true) {
        CustomSnackbar.show("Message", "OTP has been resent");
      } else {
        CustomSnackbar.showError("Message", "Failed to resend OTP");
      }
    } catch (e) {
      debugPrint("Error resending OTP: $e");
      CustomSnackbar.showError("Message", "Error resending OTP");
    }
  }

  Future<void> resetPassword(String email) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Error sending password reset email: $e");
      CustomSnackbar.show("Error", "Error sending password reset email: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
