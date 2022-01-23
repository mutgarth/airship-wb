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
  double resultContainerSize = .30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: SizedBox(
                  //height: 150,
                  child: ResultsPage(),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      (1 - resultContainerSize),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
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
                          (.9 - resultContainerSize),
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
        icon: const Icon(Icons.ac_unit),
        backgroundColor: Colors.red,
      ),
    );
  }
}
