import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wab_app/provider/data_provider.dart';
import 'package:wab_app/view/app.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: App(),
    ));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppPage(),
    );
  }
}
