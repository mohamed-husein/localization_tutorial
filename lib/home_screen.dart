import 'package:flutter/material.dart';
import 'package:localization_tutorial/app_localizations.dart';
import 'package:localization_tutorial/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('home'.tr(context)),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
          },icon: const Icon(Icons.settings)),
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          children:  [
            Text('hello_msg'.tr(context)),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
