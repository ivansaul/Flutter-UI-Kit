import "package:flutter/material.dart";

class DataTmp {
  static final List<Slide> onboardingSlides = [
    Slide(
      title: "Your first car without a driver's license",
      subtitle: "Goes to meet people who just got their license",
      imagePath: "assets/Img_car1.svg",
      backgroundColor: const Color(0xffF0CF69),
      alignment: Alignment.centerLeft,
    ),
    Slide(
      title: "Always there: more than 1000 cars in Tbilisi",
      subtitle: "Our company is a leader by the number of cars in the fleet",
      imagePath: "assets/Img_car2.svg",
      backgroundColor: const Color(0xffB7ABFD),
      alignment: Alignment.centerRight,
    ),
    Slide(
      title: "Do not pay for parking, maintenance and gasoline",
      subtitle: "We will pay for you, all expenses related to the car",
      imagePath: "assets/Img_car3.svg",
      backgroundColor: const Color(0xffEFB491),
      alignment: Alignment.centerRight,
    ),
    Slide(
      title: "29 car models: from Skoda Octavia to Porsche 911",
      subtitle: "Choose between regular car models or exclusive ones",
      imagePath: "assets/Img_car4.svg",
      backgroundColor: const Color(0xff95B6FF),
      alignment: Alignment.centerLeft,
    ),
  ];
}

class Slide {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color backgroundColor;
  final Alignment alignment;

  Slide({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundColor,
    required this.alignment,
  });
}
