import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';

class ResendTime extends StatefulWidget {
  const ResendTime({super.key, required this.controller});
  final TimeController controller;
  @override
  State<ResendTime> createState() => _ResendTimeState();
}

class _ResendTimeState extends State<ResendTime> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime(int seconds) {
      final _hours = (seconds ~/ 60).toString();
      final _seconds = (seconds % 60).toString();

      return '$_hours:$_seconds';
    }

    return Text(
      'Resend after (${formattedTime(widget.controller.secondsRemaining)})',
      style: textStyleWithPrimaryBold.copyWith(
          fontSize: 14.sp, color: Colors.black),
    );
  }
}

class TimeController extends ChangeNotifier {
  TimeController({required this.seconds});
  final int seconds;
  late Timer timer;
  int secondsRemaining = 0;
  bool enableResend = false;

  void inint() {
    secondsRemaining = seconds;
    enableResend = false;

    notifyListeners();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
        timer.cancel();
      }
    });
  }

  void close() {
    timer.cancel();
  }
}
