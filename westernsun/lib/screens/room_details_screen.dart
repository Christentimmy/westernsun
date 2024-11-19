import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:westernsun/models/room_model.dart';
import 'package:westernsun/resources/all_list_used.dart';
import 'package:westernsun/screens/booking_data_screen.dart';

class RoomDetailsScreen extends StatefulWidget {
  final RoomModel roomDetails;
  const RoomDetailsScreen({super.key, required this.roomDetails});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {

  @override
  void initState() {
    _currentImage.value = widget.roomDetails.image;
    super.initState();
  }
  final RxString _currentImage = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(()=> BookingDataScreen());
          },
          child: const Text(
            "Book Now",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayRoomImagesWidget(
              currentImage: _currentImage,
              images: images,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Aston White Coral",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      SizedBox(width: 5),
                      Text("5.0 (120 Reviews)"),
                      SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "lorem ipsum nat bum shrisk ks jwe nsnd ks wijf snc densi oknse annsne ajw oen jeccw jww ncnwi ciw iweoc jsdjsd iejd iejejc",
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Facility",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 110,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(120, 121, 85, 72),
                      ),
                    ),
                    child: SizedBox(
                      height: 70,
                      child: ListView.builder(
                        itemCount: facilities.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 70,
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(
                              minWidth: 60,
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: Colors.brown),
                              color: const Color.fromARGB(103, 121, 85, 72),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  facilities[index][1],
                                  size: 20,
                                ),
                                Text(
                                  facilities[index][0],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        "Reviews",
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
                  // SizedBox(),
                  const ReviewCard(),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.brown,
        ),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/avater.png"),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 12),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "22/10/2024",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel sodales tellus. Phasellus ante massa, mattis non tincidunt vel, maximus tempus odio. Duis consectetur commodo",
            style: TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class DisplayRoomImagesWidget extends StatelessWidget {
  const DisplayRoomImagesWidget({
    super.key,
    required RxString currentImage,
    required List images,
  })  : _currentImage = currentImage,
        _images = images;

  final RxString _currentImage;
  final List _images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Stack(
        children: [
          Obx(
            () => Image.asset(
              _currentImage.value,
              height: 380,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(125, 255, 255, 255),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: SizedBox(
              height: 60,
              width: 300,
              child: ListView.builder(
                itemCount: _images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (_currentImage.value != _images[index]) {
                        _currentImage.value = _images[index];
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: Colors.brown,
                        ),
                        image: DecorationImage(
                          image: AssetImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
