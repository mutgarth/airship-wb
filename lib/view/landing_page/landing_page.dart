import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with AutomaticKeepAliveClientMixin<LandingPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget body = ListView(
      children: [],
    );

    return MaterialApp(
      home: Scaffold(body: body),
    );
  }
}
