import 'dart:async';
import 'dart:math';
import 'package:e_learning/features/home/controller/course_controller.dart';
import 'package:e_learning/features/planning/controller/planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  var doubleValue = 0.0;
  spacecreator() {
    doubleValue = Random().nextDouble() * 200;
    Timer(Duration(seconds: 1), () {
      spacecreator();
    });
    return doubleValue;
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
            CustomCard(
              doubleValue: spacecreator(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.doubleValue});
  double doubleValue;

  @override
  Widget build(BuildContext context) {
    print(doubleValue);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6 + 50,
      width: 420,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        // itemCount: Controller().task_model.length,
        itemCount: CourseController().class_list.length,
        itemBuilder: (context, index) {
          // var data = Controller().task_model[index];
          var color = Controller().task_color[index];
          var data = CourseController().class_list[index];
          return Row(
            children: [
              // const TimeList(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6 + 50,
                width: 110,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: Controller().time_list.length,
                  itemBuilder: (context, index) {
                    var data = Controller().time_list[index];
                    return Padding(
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
                    );
                  },
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    // height: Random().nextDouble() * 20,
                    height: 0,
                  ),
                  Hero(
                    tag: index,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, right: 0, bottom: 10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: color),
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
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class TimeList extends StatelessWidget {
  const TimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6 + 50,
      width: 110,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: Controller().time_list.length,
        itemBuilder: (context, index) {
          var data = Controller().time_list[index];
          return Padding(
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
          );
        },
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          var data = days[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: AnimatedContainer(
                padding: EdgeInsets.only(right: 5, left: 5),
                width: 120,
                duration: const Duration(milliseconds: 0),
                decoration: BoxDecoration(
                    color: index == selectedDay ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  data,
                  style: GoogleFonts.plusJakartaSans(
                      color: index == selectedDay ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
