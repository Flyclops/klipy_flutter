import 'package:flutter/widgets.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class KlipyTabProvider with ChangeNotifier {
  KlipyAttributionType attributionType;
  KlipyClient client;
  KlipyTab _selectedTab;

  KlipyTabProvider({
    required this.attributionType,
    required this.client,
    required KlipyTab selectedTab,
  }) : _selectedTab = selectedTab;

  KlipyTab get selectedTab => _selectedTab;
  set selectedTab(KlipyTab selectedTab) {
    _selectedTab = selectedTab;
    notifyListeners();
  }
}
