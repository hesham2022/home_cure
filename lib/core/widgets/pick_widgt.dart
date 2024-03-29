import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/user_details/presentation/pages/photo_view_page.dart';
import 'package:home_cure/gen/assets.gen.dart';

class PickWidget extends StatelessWidget {
  const PickWidget({
    super.key,
    this.height,
    this.width,
    this.fromRight = false,
    this.file,
    this.onTap,
  });
  final bool fromRight;
  final double? height;
  final double? width;
  final String? file;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (file != null)
            InkWell(
              onTap: () {
                context.router.push(
                  PhotoViewPageeRouter(
                    path: file!,
                    provider: PhotoViewPageProvider.file,
                    // provider:PhotoViewPageeRouterProvider.
                  ),
                );
              },
              child: Container(
                margin: fromRight
                    ? const EdgeInsets.only(right: 40, left: 40)
                    : const EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(file!),
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                  borderRadius: BorderRadiusDirectional.circular(
                    8,
                  ),
                ),
                height: height ?? 65.h,
                width: width ?? 87.w,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onTap,
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 6,
                                    offset: const Offset(
                                      -3,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(1),
                              child: const Icon(
                                Icons.close,
                                color: Color(0xff1AA9A0),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            Container(
              margin: fromRight
                  ? const EdgeInsets.only(right: 40, left: 40)
                  : const EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
                borderRadius: BorderRadiusDirectional.circular(
                  8,
                ),
              ),
              height: height ?? 65.h,
              width: width ?? 87.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Assets.svg.image.svg(),
                  ),
                  Positioned(
                    bottom: -5.sp,
                    right: -15.sp,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 6,
                            offset: const Offset(
                              -3,
                              1,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Expanded(
                            child: Icon(
                              Icons.edit,
                              color: Color(0xff1AA9A0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      );
}
