/// To ensure a consistent and high-quality experience across all platforms, applications using the KLIPY API must include clear attribution.
/// - Display a visible “Powered by KLIPY” mark wherever KLIPY content is shown.
/// - Set “Search KLIPY” as the default placeholder text in the search input field.
///
/// More information https://docs.klipy.com/attribution
enum KlipyAttributionType {
  /// Use this attribution during the GIF browsing experience.
  poweredBy,

  /// Use this attribution to hide poweredBy. It's your responsibility to provide the correct attribution.
  none,
}
