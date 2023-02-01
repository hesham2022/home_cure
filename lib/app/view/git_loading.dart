import 'package:flutter/material.dart';
import 'package:home_cure/gen/assets.gen.dart';

var _backgroundColor = Colors.transparent;

void showGifLoading(BuildContext context) {
  showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierColor: _backgroundColor,
    builder: (BuildContext dialogContext) {
      return Dialog(
        backgroundColor: _backgroundColor,
        child: Center(
          child: Container(
            child: Center(
              child: Assets.img.gif.image(),
            ),
          ),
        ),
      );
    },
  );
}
