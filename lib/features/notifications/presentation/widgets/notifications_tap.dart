import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';

enum ReqestNotificion { request, notification }

class NotificationTapWidget extends StatefulWidget {
  const NotificationTapWidget({
    super.key,
    required this.initialValue,
    this.firstTitle,
    this.secondTitle,
    required this.onChange,
  });
  final ReqestNotificion initialValue;
  final Function(ReqestNotificion value) onChange;
  final String? firstTitle;
  final String? secondTitle;
  @override
  State<NotificationTapWidget> createState() => _NotificationTapWidgetState();
}

class _NotificationTapWidgetState extends State<NotificationTapWidget> {
  late ReqestNotificion _value;
  @override
  void initState() {
    setState(() {
      _value = widget.initialValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _value = ReqestNotificion.request;
                  });
                  widget.onChange(ReqestNotificion.request);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _value == ReqestNotificion.request
                        ? const Color(0xff0A84E1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      widget.firstTitle ?? 'Request Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: _value == ReqestNotificion.request
                            ? Colors.white
                            : const Color(0xff5D6C7A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _value = ReqestNotificion.notification;
                  });
                  widget.onChange(ReqestNotificion.notification);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _value != ReqestNotificion.request
                        ? const Color(0xff0A84E1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      widget.secondTitle ?? 'Notifications',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: _value != ReqestNotificion.request
                            ? Colors.white
                            : const Color(0xff5D6C7A), //5D6C7A
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
