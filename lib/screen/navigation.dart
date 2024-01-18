// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
    required this.selectedIndex,
    required this.child,
  }) : super(key: key);
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (selectedIndex != 0) {
          context.go(Routes.homescreen.path);
        }
      },
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.6),
                border: Border.all(color: Colors.red),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 30,
                //     color: Colors.pink.shade200,
                //     blurStyle: BlurStyle.normal,
                //     spreadRadius: 2,
                //     offset: const Offset(
                //       0,
                //       7,
                //     ),
                //   ),
                // ],
              ),
              child: SizedBox(
                height: 50,
                child: Text("ellow"),
              ),
          ),
          )
        ],
      ),
    );
  }
}
