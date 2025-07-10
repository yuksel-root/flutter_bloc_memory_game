import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Function onPressFunc;
  final Gradient bgGradient;
  final BorderRadius borderRadius;
  final Widget child;
  final List<BoxShadow> boxShadow;
  const CustomBtn({
    Key? key,
    required this.onPressFunc,
    required this.bgGradient,
    required this.borderRadius,
    required this.child,
    required this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return circleButton(context);
  }

  ElevatedButton circleButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.transparent;
          }
          if (states.contains(WidgetState.pressed)) {
            return Colors.transparent;
          }
          return null;
        }),
      ),
      onPressed: () {
        onPressFunc();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: bgGradient,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
