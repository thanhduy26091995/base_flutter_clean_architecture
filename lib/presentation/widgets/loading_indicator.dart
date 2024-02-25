import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.sigma = 0.3});

  final double sigma;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white.withOpacity(.15),
                color: Colors.white,
                strokeCap: StrokeCap.round,
                strokeWidth: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
