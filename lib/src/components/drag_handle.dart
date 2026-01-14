import 'package:flutter/material.dart';

class KlipyDragHandleStyle {
  final Decoration decoration;
  final double height;
  final EdgeInsets margin;
  final double width;

  const KlipyDragHandleStyle({
    this.decoration = const BoxDecoration(
      color: Color(0xFF8A8A86),
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
    this.height = 4,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.width = 134,
  });
}

class KlipyDragHandle extends StatelessWidget {
  final KlipyDragHandleStyle _style;

  const KlipyDragHandle({
    KlipyDragHandleStyle style = const KlipyDragHandleStyle(),
    super.key,
  }) : _style = style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _style.decoration,
      height: _style.height,
      margin: _style.margin,
      width: _style.width,
    );
  }
}
