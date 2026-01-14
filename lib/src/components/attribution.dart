import 'package:flutter/material.dart';

class TenorAttributionStyle {
  final Brightness brightnes;
  final double height;
  final EdgeInsets padding;

  const TenorAttributionStyle({
    this.brightnes = Brightness.light,
    this.height = 20,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });
}

class TenorAttribution extends StatelessWidget {
  final TenorAttributionStyle style;

  const TenorAttribution({
    this.style = const TenorAttributionStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String logoPath =
        style.brightnes == Brightness.light
            ? 'powered_by_dark.png'
            : 'powered_by_light.png';
    return Padding(
      // If safe area is required, add it.
      padding:
          MediaQuery.of(context).padding.bottom > 0
              ? style.padding.copyWith(
                bottom: MediaQuery.of(context).padding.bottom,
              )
              : style.padding,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Image.asset(
            'assets/$logoPath',
            package: 'klipy_flutter',
            height: style.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
