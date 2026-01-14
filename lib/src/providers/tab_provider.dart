import 'package:flutter/widgets.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class TenorTabProvider with ChangeNotifier {
  TenorAttributionType attributionType;
  KlipyClient client;
  TenorTab _selectedTab;

  TenorTabProvider({
    required this.attributionType,
    required this.client,
    required TenorTab selectedTab,
  }) : _selectedTab = selectedTab;

  TenorTab get selectedTab => _selectedTab;
  set selectedTab(TenorTab selectedTab) {
    _selectedTab = selectedTab;
    notifyListeners();
  }
}
