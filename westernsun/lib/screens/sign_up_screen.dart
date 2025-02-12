import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/controller/auth_controller.dart';
import 'package:westernsun/screens/login_screen.dart';
import 'package:westernsun/screens/my_orders_screen.dart';
import 'package:westernsun/screens/verify_otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _authController = Get.find<AuthController>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(202, 0, 0, 0),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.15),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    height: Get.height * 0.75,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/login.png",
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _fullNameController,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            validator: (value) {
                              if (value?.isEmpty == true) {
                                return "field required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: const TextStyle(
                                fontSize: 10,
                              ),
                              prefixIcon: const Icon(Icons.account_box_sharp),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.brown,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(fontSize: 13),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                fontSize: 10,
                              ),
                              prefixIcon: const Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: const TextStyle(
                                fontSize: 10,
                              ),
                              prefixIcon: const Icon(Icons.phone),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontSize: 10,
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          CustomButton(
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                await _authController.createAccount(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phoneNumber:
                                      int.parse(_phoneNumberController.text),
                                  userName: _fullNameController.text,
                                  context: context,
                                );
                              }
                            },
                            child: _authController.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          // const Spacer(),
                          SizedBox(height: Get.height * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => LoginScreen());
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
