import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:westernsun/screens/bottom_navigation.dart';

// ignore: must_be_immutable
class SuccessfulPaymentScreen extends StatelessWidget {
  final String reference;
  SuccessfulPaymentScreen({super.key, required this.reference});

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Payment Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.brown,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Lottie.asset(
                        "assets/animations/done.json",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Payment Successful",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("Reference"),
                        const Spacer(),
                        Text(reference),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("Transaction Date"),
                        const Spacer(),
                        Text(DateFormat("MMM dd yyyy").format(date)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text("Payment Method"),
                        Spacer(),
                        Text("Card"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text("Price Details"),
                        Spacer(),
                        Text("\$265"),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: ()=> Get.offAll(()=> BottomNavigationScreen()),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown,
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
