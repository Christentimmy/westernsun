import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/models/room_model.dart';
import 'package:westernsun/resources/all_list_used.dart';
import 'package:westernsun/screens/room_details_screen.dart';

class AltHomeScreen extends StatefulWidget {
  const AltHomeScreen({super.key});

  @override
  State<AltHomeScreen> createState() => _AltHomeScreenState();
}

class _AltHomeScreenState extends State<AltHomeScreen> {
  final _pageController = PageController();
  final RxBool _isloading = false.obs;

  void onClicked(int index) async {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i][1] = false;
      }
      categories[index][1] = true;
    });
    _isloading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    _isloading.value = false;

    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello There!", style: TextStyle(fontSize: 10)),
                      Text(
                        "Christen Timmy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.notifications_active),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.brown,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Explore Something Fun",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text("see all  "),
                  Icon(Icons.arrow_forward_ios, size: 15),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onClicked(index);
                      },
                      child: Container(
                        width: currentWidth * 0.214,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: categories[index][1] == false
                              ? Colors.transparent
                              : Colors.brown,
                          border: categories[index][1] == false
                              ? Border.all(color: Colors.brown, width: 2)
                              : null,
                        ),
                        child: Text(
                          categories[index][0],
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Obx(() => Expanded(
                    child: _isloading.value
                        ? const Center(child: CircularProgressIndicator())
                        : PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              PopularRoomDIsplay(),
                              KingRoomDIsplay(),
                              SuiteRoomDIsplay(),
                              DeluxeRoomDIsplay(),
                            ],
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class PopularRoomDIsplay extends StatelessWidget {
  const PopularRoomDIsplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => RoomDetailsScreen(roomDetails: rooms[index]),
              transition: Transition.zoom,
              duration: const Duration(milliseconds: 550),
            );
          },
          child: HomeRoomCard(roomModel: rooms[index]),
        );
      },
    );
  }
}

class KingRoomDIsplay extends StatelessWidget {
  const KingRoomDIsplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => RoomDetailsScreen(roomDetails: rooms[index]),
              transition: Transition.zoom,
              duration: const Duration(milliseconds: 550),
            );
          },
          child: HomeRoomCard(roomModel: rooms[index]),
        );
      },
    );
  }
}

class SuiteRoomDIsplay extends StatelessWidget {
  const SuiteRoomDIsplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => RoomDetailsScreen(roomDetails: rooms[index]),
              transition: Transition.zoom,
              duration: const Duration(milliseconds: 550),
            );
          },
          child: HomeRoomCard(roomModel: rooms[index]),
        );
      },
    );
  }
}

class DeluxeRoomDIsplay extends StatelessWidget {
  const DeluxeRoomDIsplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => RoomDetailsScreen(roomDetails: rooms[index]),
              transition: Transition.zoom,
              duration: const Duration(milliseconds: 550),
            );
          },
          child: HomeRoomCard(roomModel: rooms[index]),
        );
      },
    );
  }
}

class HomeRoomCard extends StatelessWidget {
  final RoomModel roomModel;
  const HomeRoomCard({
    super.key,
    required this.roomModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    roomModel.image,
                    fit: BoxFit.cover,
                    height: 130,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        width: 45,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(59, 0, 0, 0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              roomModel.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Divider(
              height: 5,
              thickness: 0.3,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Start from",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "\$${roomModel.price}",
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(
                              text: "/NIGHT",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(94, 121, 85, 72),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
