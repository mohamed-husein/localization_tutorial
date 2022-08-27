part of 'locale_cubit.dart';
abstract class LocaleState {
  final Locale locale;

  LocaleState(this.locale);
}


class ChangeLangState extends LocaleState{


   ChangeLangState(Locale selectedLocale) : super(selectedLocale);
}
