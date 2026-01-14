import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class KlipyCategoryStyle {
  /// Allows you to set a fallback decoration for people to see if the image loads slow or fails.
  final Decoration decoration;

  /// How tall you want the tappable category to be.
  final double height;

  /// Color that shows between the category text and image.
  final Color imageOverlayColor;

  /// KLIPY returns "#" back with the category name, this will strip it.
  final bool stripHashtag;

  /// Control how the category text looks.
  final TextStyle textStyle;

  /// Used to stop text from touching the edges when `FittedBox` kicks in.
  final EdgeInsets padding;

  const KlipyCategoryStyle({
    this.decoration = const BoxDecoration(color: Color(0xFFBEB9AC)),
    this.height = 100,
    this.imageOverlayColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.padding = const EdgeInsets.all(8),
    this.stripHashtag = true,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  });
}

class KlipyCategoryWidget extends StatelessWidget {
  final KlipyCategoryObject? category;
  final Function(KlipyCategoryObject)? onTap;
  final KlipyCategoryStyle style;

  const KlipyCategoryWidget({
    this.category,
    this.onTap,
    this.style = const KlipyCategoryStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // for promotion
    final klipyCategory = category;
    final klipyCategoryImage = klipyCategory?.image;

    // early out
    if (klipyCategory == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => onTap?.call(klipyCategory),
      child: Container(
        height: style.height,
        decoration: style.decoration,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (klipyCategoryImage != null && klipyCategoryImage.isNotEmpty)
              ExtendedImage.network(
                klipyCategoryImage,
                cache: true,
                gaplessPlayback: true,
                fit: BoxFit.cover,
              ),
            Container(
              color: style.imageOverlayColor,
              alignment: Alignment.center,
              padding: style.padding,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  style.stripHashtag && klipyCategory.name.startsWith('#')
                      ? klipyCategory.name.substring(1)
                      : klipyCategory.name,
                  style: style.textStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
