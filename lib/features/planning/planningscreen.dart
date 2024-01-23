// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:e_learning/features/planning/provider/day_provider.dart';
import 'package:e_learning/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_learning/features/home/controller/course_controller.dart';
import 'package:e_learning/features/planning/controller/planning_controller.dart';
import 'package:provider/provider.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  late ScrollController scrollControllerone, scrollControllertwo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollControllerone = ScrollController();
    scrollControllertwo = ScrollController();

    scrollControllerone.addListener(() {
      scrollControllertwo.animateTo(scrollControllerone.offset,
          duration: const Duration(microseconds: 100), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollControllerone.dispose();
    scrollControllertwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Planning",
                      style: GoogleFonts.plusJakartaSans(
                          // color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "May 22 Monday",
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DayList(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TimeList(scrollControllertwo: scrollControllertwo),
                CustomCard(
                  scrollControllerone: scrollControllerone,
                  // doubleValue: spacecreator(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  CustomCard(
      {super.key,
      // required this.doubleValue,
      required this.scrollControllerone});
  // double doubleValue;
  final ScrollController scrollControllerone;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    // print(widget.doubleValue);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6 + 50,
      width: 300,
      child: AnimationLimiter(
        child: ListView.builder(
          controller: widget.scrollControllerone,
          padding: EdgeInsets.zero,
          itemCount: CourseController().class_list.length,
          itemBuilder: (context, index) {
            var color = Controller().task_color[index];
            var data = CourseController().class_list[index];
            return Hero(
              tag: index,
              child: AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 200),
                child: SlideAnimation(
                  verticalOffset: -100,
                  curve: Curves.easeInOutSine,
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Provider.of<DayProvider>(context).val,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color),
                            height: 120,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: color),
                                        child: Image.asset(
                                          data.logo,
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          data.image,
                                          fit: BoxFit.cover,
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data.name,
                                        style: GoogleFonts.plusJakartaSans(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Text(
                                    data.topic,
                                    style: GoogleFonts.plusJakartaSans(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TimeList extends StatefulWidget {
  TimeList({
    Key? key,
    required this.scrollControllertwo,
  }) : super(key: key);
  final ScrollController scrollControllertwo;

  @override
  State<TimeList> createState() => _TimeListState();
}

class _TimeListState extends State<TimeList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6 + 50,
      width: 110,
      child: AnimationLimiter(
        child: ListView.builder(
          controller: widget.scrollControllertwo,
          padding: EdgeInsets.zero,
          itemCount: Controller().time_list.length,
          itemBuilder: (context, index) {
            var data = Controller().time_list[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 300,
                curve: Curves.fastEaseInToSlowEaseOut,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70, left: 20),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        data,
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.grey.shade500,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DayList extends StatefulWidget {
  const DayList({super.key});

  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  int selectedDay = 0;
  List<String> days = ['Today', 'This week', 'Next week'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) {
            var data = days[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(microseconds: 1000),
              child: SlideAnimation(
                curve: Easing.standardAccelerate,
                delay: const Duration(milliseconds: 300),
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                          Provider.of<DayProvider>(context, listen: false)
                              .setval();
                          context.go(Routes.planningscreen.path);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: AnimatedContainer(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          width: 120,
                          duration: const Duration(milliseconds: 0),
                          decoration: BoxDecoration(
                              color: index == selectedDay
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: Text(
                            data,
                            style: GoogleFonts.plusJakartaSans(
                                color: index == selectedDay
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
