import 'package:flutter/material.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class CustomerServiceHeader extends StatelessWidget {
  const CustomerServiceHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = context.l10n.localeName == 'ar';
    print(isAr);
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
            right: !isAr ? 0 : null,
            left: isAr ? 0 : null,
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
              right: 15,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      context.l10n.contact,
                      // 'Contact',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Color(0xff409CE6),
                      ),
                    ),
                    Text(
                      context.l10n.customaer_service,
                      //   'Customer Service',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xff1AA9A0),
                      ),
                    ),
                    Text(
                      '''
${context.l10n.select_what_you_feel}\n ${context.l10n.and_we_will_contact_you_soon}''',
                      style: const TextStyle(
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
