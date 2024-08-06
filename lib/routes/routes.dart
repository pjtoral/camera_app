import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  SlidePageRoute({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end);
            var offsetAnimation =
                animation.drive(tween.chain(CurveTween(curve: curve)));

            if (direction == AxisDirection.left) {
              tween = Tween(begin: Offset(-1.0, 0.0), end: end);
              offsetAnimation =
                  animation.drive(tween.chain(CurveTween(curve: curve)));
            }

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
