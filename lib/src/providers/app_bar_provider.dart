import 'package:flutter/widgets.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

class KlipyAppBarProvider with ChangeNotifier {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  String _queryText = '';
  String get queryText => _queryText;
  String _previousQueryText = '';
  String get previousQueryText => _previousQueryText;
  KlipyCategoryObject? _selectedCategory;

  Duration _debounce = Duration.zero;
  Duration get debounce => _debounce;

  set queryText(String queryText) {
    _previousQueryText = _queryText;
    _queryText = queryText;
    // reset selected category
    if (_queryText.isEmpty) {
      _selectedCategory = null;
    }
    notifyListeners();
  }

  KlipyAppBarProvider(
    String queryText,
    Duration debounce, {
    required this.keyboardDismissBehavior,
    KlipyCategoryObject? selectedCategory,
  }) : _selectedCategory = selectedCategory,
       super() {
    _queryText = queryText;
    _previousQueryText = queryText;
    _debounce = debounce;
  }

  KlipyCategoryObject? get selectedCategory => _selectedCategory;
  set selectedCategory(KlipyCategoryObject? newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
