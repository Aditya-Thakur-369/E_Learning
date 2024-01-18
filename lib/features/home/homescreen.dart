import 'package:e_learning/common/common_color.dart';
import 'package:e_learning/features/home/controller/course_controller.dart';
import 'package:e_learning/features/home/model/course_model.dart';
import 'package:e_learning/features/home/screen/fade-animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          FadeInAnimation(delay: 0.8, child: TopBar()),
          const SizedBox(
            height: 20,
          ),
          FadeInAnimation(
            delay: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nice Streak",
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Andrew",
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 270,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CourseController().course_list.length,
                itemBuilder: (context, index) {
                  var color1 = CourseController().color_list1[index];
                  var color = CourseController().color_list[index];
                  var data = CourseController().course_list[index];

                  return FadeInAnimation(
                    delay: 1.5,
                    child: CourseCard(
                      data: data,
                      color: color,
                      color1: color1,
                    ),
                  );
                },
              ),
            ),
          ),
          FadeInAnimation(
            delay: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Today Classes",
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_1,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: CourseController().class_list.length,
              itemBuilder: (context, index) {
                var color = CourseController().class_color[index];
                var data = CourseController().class_list[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 15, left: 15),
                  child: FadeInAnimation(
                    delay: 2.5,
                    child: ClassCard(
                      data: data,
                      color: color,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CourseCard extends StatefulWidget {
  const CourseCard({
    super.key,
    required this.data,
    required this.color,
    required this.color1,
  });
  final CourseModel data;
  final Color color;
  final Color color1;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.status1,
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.data.status2,
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                child: Text(
                  // " ${data.days}",
                  "${widget.data.days}",
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 30,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: widget.color1,
                ),
                child: Center(
                    child: Text(
                  widget.data.info,
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Commoncolor().green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Commoncolor().black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/dp1.jpeg",
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 44,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Commoncolor().black, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "3",
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.only(top: 12, bottom: 12, right: 25, left: 25)),
                backgroundColor: MaterialStatePropertyAll(Commoncolor().black)),
            onPressed: () {},
            child: Text(
              "Connext to class",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class ClassCard extends StatefulWidget {
  const ClassCard({super.key, required this.data, required this.color});
  final ClassModel data;
  final Color color;

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.data.topic,
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(widget.data.status,
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        widget.data.image,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.data.name,
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w300))
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                widget.data.logo,
                scale: 1.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
