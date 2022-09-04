import 'package:flutter/material.dart';
import 'package:home_cure/gen/assets.gen.dart';

class CustomerServiceHeader extends StatelessWidget {
  const CustomerServiceHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xffFFFFFF).withOpacity(.5),
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.img.callCenter.image(
                      height: 130,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 40),
                    Text(
                      'Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Color(0xff409CE6),
                      ),
                    ),
                    Text(
                      'Customer Service',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xff1AA9A0),
                      ),
                    ),
                    Text(
                      '''
Select what you feel\n and we will call you soon''',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff1AA9A0),
                      ),
                    )
                  ],
                ),
                // Assets.img.phone2.image()
              ],
            ),
          )
        ],
      ),
    );
  }
}
