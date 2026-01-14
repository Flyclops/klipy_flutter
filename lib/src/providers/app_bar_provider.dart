import 'package:flutter/widgets.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class TenorAppBarProvider with ChangeNotifier {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  String _queryText = '';
  String get queryText => _queryText;
  KlipyCategoryObject? _selectedCategory;

  Duration _debounce = Duration.zero;
  Duration get debounce => _debounce;

  set queryText(String queryText) {
    _queryText = queryText;
    // reset selected category
    if (_queryText.isEmpty) {
      _selectedCategory = null;
    }
    notifyListeners();
  }

  TenorAppBarProvider(
    String queryText,
    Duration debounce, {
    required this.keyboardDismissBehavior,
    KlipyCategoryObject? selectedCategory,
  }) : _selectedCategory = selectedCategory,
       super() {
    _queryText = queryText;
    _debounce = debounce;
  }

  KlipyCategoryObject? get selectedCategory => _selectedCategory;
  set selectedCategory(KlipyCategoryObject? newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
