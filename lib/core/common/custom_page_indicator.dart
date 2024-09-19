import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';

class CustomPageIndicator extends StatefulWidget {
  final PageController controller;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;
  final double activeDotHeight;
  final double activeDotWidth;
  final double inactiveDotHeight;
  final double inactiveDotWidth;
  final double dotSpacing;
  final bool trailing;

  const CustomPageIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    this.activeColor = KColors.accentColor,
    this.inactiveColor = KColors.greyColor,
    this.activeDotHeight = 10.0,
    this.activeDotWidth = 20.0,
    this.inactiveDotHeight = 8.0,
    this.inactiveDotWidth = 20.0,
    this.dotSpacing = 8.0,
    this.trailing = false,
  }) : super(key: key);

  @override
  State<CustomPageIndicator> createState() => _CustomPageIndicatorState();
}

class _CustomPageIndicatorState extends State<CustomPageIndicator> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.controller.initialPage;
    try {
      widget.controller.addListener(_handlePageChange);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handlePageChange);
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentIndex = widget.controller.page!.round();
    });
  }

  void _handleDotPressed(int index) {
    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.itemCount,
          (index) {
            final isActive = widget.trailing
                ? index <= _currentIndex
                : index == _currentIndex;
            return GestureDetector(
              onTap: () => _handleDotPressed(index),
              child: Container(
                width:
                    isActive ? widget.activeDotWidth : widget.inactiveDotWidth,
                height: isActive
                    ? widget.activeDotHeight
                    : widget.inactiveDotHeight,
                margin: EdgeInsets.symmetric(horizontal: widget.dotSpacing / 2),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(100),
                  color: isActive ? widget.activeColor : widget.inactiveColor,
                  border: isActive
                      ? Border.all(color: widget.activeColor, width: 2.0)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
