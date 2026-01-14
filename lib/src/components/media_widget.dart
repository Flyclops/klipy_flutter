import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KlipyMediaWidget extends StatelessWidget {
  final Widget media;

  const KlipyMediaWidget({required this.media, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        media,
        Positioned(
          bottom: 2,
          left: 2,
          child: Image.asset(
            'assets/media_watermark.png',
            package: 'klipy_flutter',
            height: 10,
          ),
        ),
      ],
    );
  }
}
