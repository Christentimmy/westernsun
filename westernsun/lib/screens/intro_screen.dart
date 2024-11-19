import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:westernsun/screens/login_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final RxInt _activeIndex = 0.obs;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Container(),
              const SizedBox(height: 20),
              Text(
                "WesterSun",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 204, 174, 163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    _activeIndex.value = value;
                  },
                  children: [
                    intro1(),
                    intro2(),
                    intro3(),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.offAll(()=> LoginScreen());
                    },
                    child: const Text("Skip"),
                  ),
                  const Spacer(),
                  Obx(
                    () => AnimatedSmoothIndicator(
                      activeIndex: _activeIndex.value,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.brown,
                        dotHeight: 10,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (_activeIndex.value == 2) {
                        Get.to(() => LoginScreen());
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.brown,
                      ),
                      child: const Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget intro1() {
    return Column(
      children: [
        const Spacer(),
        // Lottie.asset("assets/animations/Animation.json"),
        Image.asset("assets/images/intro.png"),
        const Spacer(),
        const Text(
          "Stay In Style!\nBook With A Smile!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Your perfect stay is just a reservation\naway, book now and make moments\nthat matters.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget intro2() {
    return Column(
      children: [
        const Spacer(),
        // Lottie.asset("assets/animations/Animation.json"),
        Image.asset(
          "assets/images/intro2.png",
          width: 250,
        ),
        const Spacer(),
        const Text(
          "Stay In Style!\nBook With A Smile!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Your perfect stay is just a reservation\naway, book now and make moments\nthat matters.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget intro3() {
    return Column(
      children: [
        const Spacer(),
        // Lottie.asset("assets/animations/Animation.json"),
        Image.asset(
          "assets/images/intro3.png",
          width: 270,
        ),
        const Spacer(),
        const Text(
          "Stay In Style!\nBook With A Smile!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Your perfect stay is just a reservation\naway, book now and make moments\nthat matters.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
