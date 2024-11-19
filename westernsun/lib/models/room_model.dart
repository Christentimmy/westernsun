import 'package:westernsun/models/review_model.dart';

class RoomModel {
  final String name;
  final String price;
  final String image;
  final String description;
  final int totalReview;
  final ReviewModel topReview;

  RoomModel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.totalReview,
    required this.topReview,
  });
}

