import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vg_cli/core/localization/cubit/locale_cubit.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

Locale getLocale(String lanCode) {
  switch (lanCode) {
    case SupportedLanguageLocales.arabicLocale:
      return const Locale(SupportedLanguageLocales.arabicLocale);
    default:
      return const Locale(SupportedLanguageLocales.engLangCode);
  }
}

Future<void> changeLanguage(String languageCode) async {
  await AppLocalizations.delegate.load(getLocale(languageCode)).then((value) {
    SupportedLanguageLocales.currentLocale = languageCode;
  });
}
