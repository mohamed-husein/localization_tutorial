import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_tutorial/app_localizations.dart';
import 'package:localization_tutorial/cubit/locale_cubit.dart';
import 'package:localization_tutorial/home_screen.dart';
import 'package:localization_tutorial/service_locator.dart';

void main()  {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocaleCubit()..getSavedLanguage(),
          )
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            localeResolutionCallback: (locales, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locales != null &&
                    locales.languageCode == locale.languageCode) {
                  return locales;
                }
              }
              return supportedLocales.first;
            },
            home: const HomeScreen(),
          ),
        ));
  }
}
