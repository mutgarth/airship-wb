import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wab_app/view/env_page/env_page.dart';
import 'package:wab_app/view/results_page/results_page.dart';
import 'package:wab_app/view/takeoff_page/takeoff_page.dart';

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ADB Pilot'),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                // margin: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),

                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: SizedBox(
                  height: 300,
                  child: ResultsPage(),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Column(children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(icon: Icon(Icons.article)),
                          Tab(icon: Icon(Icons.airplanemode_active)),
                          // Tab(icon: Icon(Icons.flight_land)),
                        ],
                      ),
                    ),
                    Container(
                      height: 550,
                      child: TabBarView(
                        children: [
                          EnvPage(),
                          TakeOffPage(),
                          //  LandingPage(),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ]),
      ),
    );
  }
}
