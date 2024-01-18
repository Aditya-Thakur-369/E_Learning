// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
              child: SizedBox(
                height: 50,
                child: CustomNavBar(
                  colors: Colors.black,
                  selectedColor: Colors.white,
                  icons: [
                    selectedIndex == 0 ? Iconsax.home5 : Iconsax.home_1,
                    selectedIndex == 1 ? Iconsax.graph : Iconsax.graph,
                    selectedIndex == 2
                        ? Iconsax.calendar_25
                        : Iconsax.calendar_search4,
                    selectedIndex == 3 ? Iconsax.message5 : Iconsax.message,
                  ],
                  currentIndex: selectedIndex,
                  onItemTap: (index) => context.go(_indexToTab(index)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String _indexToTab(int index) {
  switch (index) {
    case 0:
      return Routes.homescreen.path;
    case 1:
      return Routes.staticsscreen.path;
    case 2:
      return Routes.planningscreen.path;
    case 3:
      return Routes.settingscreen.path;
    default:
      return Routes.homescreen.path;
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    required this.icons,
    required this.currentIndex,
    required this.onItemTap,
    required this.selectedColor,
    required this.colors,
  });

  final List<IconData> icons;
  final int currentIndex;
  final void Function(int index) onItemTap;
  final Color selectedColor;
  final Color colors;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double lineSize = constraints.maxWidth / widget.icons.length;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 0),
              margin: EdgeInsets.only(left: widget.currentIndex * lineSize),
              height: 80,
              width: lineSize,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.icons.map(
                (e) {
                  int index = widget.icons.indexOf(e);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: (lineSize - 48) / 2),
                    child: SizedBox(
                      width: 48,
                      child: MaterialButton(
                        animationDuration: Duration(milliseconds: 2000),
                        elevation: 0,
                        minWidth: 10,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        splashColor: Colors.black,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        onPressed: widget.currentIndex == index
                            ? null
                            : () {
                                widget.onItemTap(index);
                              },
                        child: Icon(
                          e,
                          color: widget.currentIndex == index
                              ? widget.selectedColor
                              : Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    });
  }
}
