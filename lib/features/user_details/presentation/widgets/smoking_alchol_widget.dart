// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:home_cure/app/app.dart';

class SmookingAlchol extends StatefulWidget {
  const SmookingAlchol({
    super.key,
    required this.smooking,
    required this.alcoholics,
    required this.onSmookingChange,
    required this.onAlcholChange,
  });
  final bool smooking;
  final bool alcoholics;
  final Function(bool value) onSmookingChange;
  final Function(bool value) onAlcholChange;

  @override
  State<SmookingAlchol> createState() => _SmookingAlcholState();
}

class _SmookingAlcholState extends State<SmookingAlchol> {
  bool smooking = false;
  bool alcoholics = false;
  @override
  void initState() {
    smooking = widget.smooking;
    alcoholics = widget.alcoholics;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Smooking', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: smooking,
                    onChanged: (v) {
                      widget.onSmookingChange(v!);
                      setState(() {
                        smooking = v;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('Alcoholics', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: alcoholics,
                    onChanged: (v) {
                      widget.onAlcholChange(v!);

                      setState(() {
                        alcoholics = v;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      );
}
