///
/// 애니메이션 폴더
///

import 'package:flutter/material.dart';

Widget slideLeft2Right(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
    ) {
  return SlideTransition(
    child: child,
    position: animation.drive(
      Tween(
        begin: Offset(-1.0, 0.0),
        end: Offset.zero
      ).chain(
        CurveTween(curve: Curves.ease)
      )
    )
  );
}

Widget slideRigth2Left(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
    ) {
  return SlideTransition(
      child: child,
      position: animation.drive(
          Tween(
              begin: Offset(1.0, 0.0),
              end: Offset.zero
          ).chain(
              CurveTween(curve: Curves.ease)
          )
      )
  );
}