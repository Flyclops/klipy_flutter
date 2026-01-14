import 'package:flutter/material.dart';
import 'package:klipy_flutter/src/utilities/is_tablet.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class TenorViewEmojis extends StatelessWidget {
  final KlipyClient client;
  final int? gifsPerRow;
  final TenorTabViewStyle style;

  const TenorViewEmojis({
    required this.client,
    this.gifsPerRow,
    this.style = const TenorTabViewStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TenorTabView(
      client: client,
      gifsPerRow: gifsPerRow ?? (isTablet(context) ? 8 : 9),
      keepAliveTabView: true,
      onLoad: (queryText, pos, limit, category) async {
        if (queryText.isNotEmpty) {
          return await client.search(
            '$queryText emoji',
            mediaFilter: const [KlipyMediaFormat.tinyGifTransparent],
            pos: pos,
            limit: limit,
            sticker: true,
          );
        } else {
          return await client.search(
            'emoji',
            mediaFilter: const [KlipyMediaFormat.tinyGifTransparent],
            pos: pos,
            limit: limit,
            sticker: true,
          );
        }
      },
      style: style,
    );
  }
}
