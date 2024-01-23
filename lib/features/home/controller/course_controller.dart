import 'package:e_learning/common/common_color.dart';
import 'package:e_learning/features/home/model/course_model.dart';
import 'package:flutter/material.dart';

class CourseController {
  List<CourseModel> course_list = [
    CourseModel(
        id: "1",
        status1: "Day",
        status2: "in Tranning",
        days: 255,
        info: "24 dyas in row"),
    CourseModel(
        id: "2",
        status1: "Completed",
        status2: "Course",
        days: 12,
        info: "2 in this month")
  ];

  List<Color> color_list = [
    Commoncolor().yellow,
    Color.fromARGB(255, 214, 233, 233)
  ];
  List<Color> color_list1 = [Colors.amber.shade200, Colors.lightBlue.shade100];

  List<ClassModel> class_list = [
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Design system in figma",
        status: "Ongoing",
        image: "assets/images/dp2.jpeg",
        name: "Alex M",
        logo: "assets/images/figma_logo.png"),
    ClassModel(
        topic: "Animation in Protopie",
        status: "2:00 PM",
        image: "assets/images/dp2.jpeg",
        name: "Nicolas F",
        logo: "assets/images/figma_logo.png"),
  ];
  List<Color> class_color = [
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
    Color.fromARGB(255, 214, 233, 233),
    Color(0xFFDAD1FC),
  ];
}
