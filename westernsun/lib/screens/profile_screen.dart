import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/screens/login_screen.dart';
import 'package:westernsun/screens/privacy_policy_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              const Center(
                child: CircleAvatar(
                  radius: 68,
                  backgroundColor: Colors.brown,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage("assets/images/avater.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Timmy Christen",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "timmychris09@gmail.com",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              ListTile(
                leading: const Icon(Icons.privacy_tip_rounded),
                title: const Text("Privacy & Policy"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Get.to(()=> const PrivacyPolicyScreen());
                },
              ),
              const ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text("Notification"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.verified_user_sharp),
                title: const Text("License"),
                onTap: (){
                  showLicensePage(context: context);
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: (){
                  Get.offAll(()=> const LoginScreen());
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
