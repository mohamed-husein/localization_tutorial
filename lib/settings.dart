import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_tutorial/app_localizations.dart';
import 'package:localization_tutorial/cubit/locale_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BlocBuilder<LocaleCubit,LocaleState>(
                builder: (context, state) {
                  return DropdownButton<String>(
                    value: state.locale.languageCode,
                    onChanged: (value) {
                      BlocProvider.of<LocaleCubit>(context).changeLang(value);
                    },
                    items: ['ar', 'en'].map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  );
                },
              )),
        ],
      ),
    );
  }
}

