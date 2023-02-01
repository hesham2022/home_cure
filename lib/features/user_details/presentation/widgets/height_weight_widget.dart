// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';
import 'package:home_cure/l10n/l10n.dart';

class HeightWeightWidget extends StatefulWidget {
  const HeightWeightWidget({
    super.key,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.heightController,
    required this.weightController,
    required this.bloodTypeController,
    this.onChanged,
  });
  final int height;
  final int weight;
  final String bloodType;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController bloodTypeController;
  final Function(String)? onChanged;

  @override
  State<HeightWeightWidget> createState() => _HeightWeightWidgetState();
}

class _HeightWeightWidgetState extends State<HeightWeightWidget> {
  String _value = '';
  final types = ['A', 'A+', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-', ''];
  @override
  void initState() {
    widget.heightController.text = widget.height.toString();
    widget.weightController.text = widget.weight.toString();
    widget.bloodTypeController.text = widget.bloodType;
    setState(() {
      _value = widget.bloodType;
    });
    // heightController.addListener(() {
    //   if (heightController.text.isEmpty) {
    //     heightController.text = '0';
    //   }
    // });
    // weightController.addListener(() {
    //   if (weightController.text.isEmpty) {
    //     weightController.text = '0';
    //   }
    // });
    // bloodTypeController.addListener(() {
    //   if (bloodTypeController.text.isEmpty) {
    //     bloodTypeController.text = 'A+';
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: Colors.white,
      height: 144.h,
      br: 25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.height,
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: SmallTextFiel(
                      onChanged: widget.onChanged,
                      keyboardType: TextInputType.number,
                      controller: widget.heightController,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.weight,
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: SmallTextFiel(
                      onChanged: widget.onChanged,
                      keyboardType: TextInputType.number,
                      controller: widget.weightController,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.bloodType,
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixStyle: Theme.of(context).textTheme.subtitle1,
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: const Color(0xff1AA9A0).withOpacity(.1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff3636364d),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff3636364d),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff3636364d),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff3636364d),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      key: const Key('bloodTypeKey'),
                      onChanged: (value) {
                        widget.bloodTypeController.text = value ?? '';
                        setState(() {
                          _value = value!;
                        });
                        widget.onChanged!(value ?? '');
                      },
                      value: _value,
                      items: types
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: e.isEmpty ? const SizedBox() : Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
