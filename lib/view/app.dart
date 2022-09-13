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
    double resultContainerSize = MediaQuery.of(context).size.height * 0.00035;
    double appBarSize = MediaQuery.of(context).size.height * 0.02;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        toolbarHeight: appBarSize,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height:
                    MediaQuery.of(context).size.height * resultContainerSize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: SizedBox(
                  child: ResultsPage(),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      (0.94 - resultContainerSize),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
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
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height *
                          (0.8 - resultContainerSize),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Save Data'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
