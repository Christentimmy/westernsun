import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:westernsun/controller/timer_controller.dart';
import 'package:westernsun/screens/bottom_navigation.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  VerifyPhoneNumberScreen({super.key});
  final _timeController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Enter Code",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Verify Email Address",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              "Kindly enter the OTP sent to your email address",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 45),
            Center(
              child: Pinput(
                closeKeyboardWhenCompleted: true,
                onCompleted: (value) {
                  // Get.to(()=> CreateProfileScreen());
                  Get.to(() => BottomNavigationScreen());
                },
                focusedPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.grey,
                    border: Border.all(
                      width: 2,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Resend: code in: ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      _timeController.startTimer();
                    },
                    child: Text(
                      _timeController.secondsLeft.value <= 0
                          ? "Resend"
                          : _timeController.secondsLeft.value.toString(),
                      style: const TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
