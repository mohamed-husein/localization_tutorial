import 'dart:ui';

import 'package:localization_tutorial/language_cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(ChangeLangState(const Locale('en')));





  Future getSavedLanguage()async
  {
    final String cachedLanguageCode =await LanguageCacheHelper().getCache();
    emit(ChangeLangState(Locale(cachedLanguageCode)));

  }
  Future changeLang (langCode)async
  {
    await LanguageCacheHelper( ).cacheLang(langCode);
    emit(ChangeLangState(Locale(langCode)));
  }
}
