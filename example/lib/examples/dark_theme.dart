import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => DarkThemeState();
}

class DarkThemeState extends State<DarkTheme> {
  // replace apiKey with an api key provided by KLIPY > https://docs.klipy.com/getting-started
  var klipyClient = KlipyClient(apiKey: FlutterConfig.get('KLIPY_API_KEY'));
  // define a result that we can display later
  KlipyResultObject? selectedResult;

  @override
  Widget build(BuildContext context) {
    final selectedGif = selectedResult?.media.tinyGif ??
        selectedResult?.media.tinyGifTransparent;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dark Theme Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedResult != null && selectedGif != null
                ? Image.network(
                    selectedGif.url,
                    width: selectedGif.dimensions.width,
                    height: selectedGif.dimensions.height,
                  )
                : const Text('No GIF selected'),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () async {
              final result = await klipyClient.showAsBottomSheet(
                context: context,
                style: KlipyStyle(
                  color: const Color(0xFF2b2d31),
                  searchFieldStyle: const KlipySearchFieldStyle(
                    fillColor: Color(0xFF1e1f22),
                    hintStyle: TextStyle(
                      color: Color(0xFFb5bac1),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  attributionStyle: const KlipyAttributionStyle(
                    brightnes: Brightness.dark,
                  ),
                  tabBarStyle: KlipyTabBarStyle(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1e1f22),
                      border: Border.all(
                        color: const Color(0xFF2b2d31),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    indicator: BoxDecoration(
                      color: const Color(0xFF404249),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: const Color(0xFFb5bac1),
                    labelColor: Colors.white,
                  ),
                  selectedCategoryStyle: const KlipySelectedCategoryStyle(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15,
                      color: Colors.white,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  tabViewStyle: const KlipyTabViewStyle(
                    mediaBackgroundColor: Color(0xFF404249),
                  ),
                ),
                tabs: [
                  KlipyTab(
                    name: 'Emojis',
                    view: KlipyViewEmojis(
                      client: klipyClient,
                      style: const KlipyTabViewStyle(
                        mediaBackgroundColor: Color(0xFF404249),
                      ),
                    ),
                  ),
                  KlipyTab(
                    name: 'GIFs',
                    view: KlipyViewGifs(
                      client: klipyClient,
                      style: const KlipyTabViewStyle(
                        mediaBackgroundColor: Color(0xFF404249),
                      ),
                      featuredCategory: '📈 Featured22',
                    ),
                  ),
                  KlipyTab(
                    name: 'Stickers',
                    view: KlipyViewStickers(
                      client: klipyClient,
                      style: const KlipyTabViewStyle(
                        mediaBackgroundColor: Color(0xFF404249),
                      ),
                    ),
                  ),
                ],
              );
              setState(() {
                selectedResult = result;
              });
            },
            tooltip: 'Dark Theme',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
