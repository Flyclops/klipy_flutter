import 'package:flutter/material.dart';
import 'package:klipy_flutter/src/components/tab_view.dart';
import 'package:klipy_flutter/src/utilities/is_tablet.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class KlipyViewGifs extends StatelessWidget {
  final KlipyClient client;
  final String? featuredCategory;
  final int? gifsPerRow;
  final bool showCategories;
  final KlipyTabViewStyle style;

  const KlipyViewGifs({
    required this.client,
    this.featuredCategory,
    this.gifsPerRow,
    this.showCategories = true,
    this.style = const KlipyTabViewStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KlipyTabView(
      client: client,
      featuredCategory: featuredCategory,
      gifsPerRow: gifsPerRow ?? (isTablet(context) ? 3 : 2),
      keepAliveTabView: true,
      showCategories: showCategories,
      onLoad: (queryText, pos, limit, category) async {
        if (queryText.isNotEmpty) {
          return await client.search(queryText, pos: pos, limit: limit);
        } else {
          if (showCategories) {
            // if a trending is selected, seatch them up
            if (category?.path == featuredCategoryPath) {
              return await client.featured(pos: pos, limit: limit);
            }
            // don't hit the api since we already have the categories
            return null;
          }

          // ask for new featured gifs since categories are disabled
          return await client.featured(pos: pos, limit: limit);
        }
      },
      style: style,
    );
  }
}
