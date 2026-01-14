import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => LocalizationState();
}

class LocalizationState extends State<Localization> {
  // replace apiKey with an api key provided by KLIPY > https://docs.klipy.com/getting-started
  var klipyClient = KlipyClient(
    apiKey: FlutterConfig.get('KLIPY_API_KEY'),
    country: 'es',
    locale: 'es_ES',
  );
  // define a result that we can display later
  KlipyResultObject? selectedResult;

  @override
  Widget build(BuildContext context) {
    final selectedGif = selectedResult?.media.tinyGif ??
        selectedResult?.media.tinyGifTransparent;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Localization Example'),
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
                : const Text('No se seleccionó ningún GIF'),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final result = await klipyClient.showAsBottomSheet(
                context: context,
                searchFieldHintText: 'Buscar KLIPY',
                tabs: [
                  KlipyTab(
                    name: 'Caritas',
                    view: KlipyViewEmojis(
                      client: klipyClient,
                    ),
                  ),
                  KlipyTab(
                    name: 'Fotos',
                    view: KlipyViewGifs(
                      client: klipyClient,
                      featuredCategory: '📈 Destacada',
                    ),
                  ),
                  KlipyTab(
                    name: 'Pegatinas',
                    view: KlipyViewStickers(
                      client: klipyClient,
                    ),
                  ),
                ],
              );
              setState(() {
                selectedResult = result;
              });
            },
            tooltip: 'Localization',
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
