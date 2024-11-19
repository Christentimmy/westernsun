  import 'package:flutter/material.dart';
import 'package:westernsun/models/review_model.dart';
import 'package:westernsun/models/room_model.dart';

final List images = [
    "assets/images/5.jpg",
    "assets/images/8.jpg",
    "assets/images/1.jpg",
    "assets/images/2.jpg",
  ];

  final List facilities = [
    ["Wi-fi", Icons.wifi],
    ["Car Park", Icons.garage],
    ["Satellite Tv", Icons.tv],
    ["Safe Environment", Icons.health_and_safety_rounded],
    ["Breakfast", Icons.food_bank]
  ];


   final List categories = [
    ["Popular", true],
    ["King", false],
    ["Suites", false],
    ["Deluxe", false],
  ];

  final List<RoomModel> rooms = [
    RoomModel(
      name: "King Room",
      price: "12K",
      image: "assets/images/1.jpg",
      description:
          "leo sit amet suscipit. Donec ut urna condimentum, congue risus sed, faucibus libero. Nulla lobortis scelerisque egestas. Morbi eros mi, efficitur sit amet blandit eget, ultrices nec ipsum. Praesent eget lobortis eros, non cursus tellus. Phasellus ut metus ipsum. Nullam non",
      totalReview: 222,
      topReview: ReviewModel(
        name: "John Timmy",
        image: "assets/images/avater.png",
        date: "22/10/2024",
        description:
            "leo sit amet suscipit. Donec ut urna condimentum, congue risu",
      ),
    ),
    RoomModel(
      name: "Queen Room",
      price: "20K",
      image: "assets/images/2.jpg",
      description:
          "Nulla non massa magna. Aenean justo nunc, laoreet vel massa tincidunt, ultricies consequat magna. Nunc facilisis hendrerit turpis, a pulvinar lacus dignissim porttitor. Morbi et blandit eget, ultrices nec ipsum. Praesent eget lobortis eros, non cursus tellus. Phasellus ut metus ipsum. Nullam non",
      totalReview: 302,
      topReview: ReviewModel(
        name: "John Timmy",
        image: "assets/images/avater.png",
        date: "22/10/2024",
        description:
            "Nam quis dignissim urna, vehicula sollicitudin nibh. Ut lorem ante, auctor eget sapien et, sagittis faucibus risus. Donec",
      ),
    ),
    RoomModel(
      name: "Suites",
      price: "125",
      image: "assets/images/3.jpg",
      description:
          "leo sit amet suscipit. Donec ut urna condimentum, congue risus sed, faucibus libero. Nulla lobortis scelerisque egestas. Morbi eros mi, efficitur sit amet blandit eget, ultrices nec ipsum. Praesent eget lobortis eros, non cursus tellus. Phasellus ut metus ipsum. Nullam non",
      totalReview: 302,
      topReview: ReviewModel(
        name: "John Timmy",
        image: "assets/images/avater.png",
        date: "22/10/2024",
        description:
            "Nam quis dignissim urna, vehicula sollicitudin nibh. Ut lorem ante, auctor eget sapien et, sagittis faucibus risus. Donec",
      ),
    ),
    RoomModel(
      name: "Junior Suites",
      price: "50",
      image: "assets/images/4.jpg",
      description:
          "leo sit amet suscipit. Donec ut urna condimentum, congue risus sed, faucibus libero. Nulla lobortis scelerisque egestas. Morbi eros mi, efficitur sit amet blandit eget, ultrices nec ipsum. Praesent eget lobortis eros, non cursus tellus. Phasellus ut metus ipsum. Nullam non",
      totalReview: 302,
      topReview: ReviewModel(
        name: "John Timmy",
        image: "assets/images/avater.png",
        date: "22/10/2024",
        description:
            "Nam quis dignissim urna, vehicula sollicitudin nibh. Ut lorem ante, auctor eget sapien et, sagittis faucibus risus. Donec",
      ),
    ),
  ];