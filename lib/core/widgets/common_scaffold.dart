import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.customScaffold,
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? customScaffold;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: Container(
            width: 500,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomRight,
                  end: FractionalOffset.topLeft,
                  colors: [
                    const Color(0xffF8E5E8).withOpacity(.8),
                    const Color(0xffE6DAF5).withOpacity(.8),
                    const Color(0xffE4F0FC).withOpacity(.8),
                    const Color(0xffE8EEF2).withOpacity(.8),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -250,
                    right: -300,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffD74B7F),
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -600,
                    left: -300,
                    child: Container(
                      height: 948,
                      width: 422,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(211),
                        border: Border.all(
                          color: const Color(0xffD74B7F),
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  customScaffold ??
                      Scaffold(
                        // resizeToAvoidBottomInset: false,
                        backgroundColor: Colors.transparent,
                        body: body,
                        bottomNavigationBar: bottomNavigationBar,
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
