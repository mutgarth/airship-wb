import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wab_app/provider/data_provider.dart';

class EnvPage extends StatefulWidget {
  _EnvPageState createState() => _EnvPageState();
}

class _EnvPageState extends State<EnvPage>
    with AutomaticKeepAliveClientMixin<EnvPage> {
  @override
  bool get wantKeepAlive => true;
  final humidityController = TextEditingController();
  final purityController = TextEditingController();
  final elevController = TextEditingController();
  final elevControllerLD = TextEditingController();
  final oatTOController = TextEditingController();
  final oatLDController = TextEditingController();
  final htempTOController = TextEditingController();
  final htempoLDController = TextEditingController();
  final fuelTOController = TextEditingController();
  final fuelLDController = TextEditingController();
  final qnhTOController = TextEditingController();
  final qnhLDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget body = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputCircleContainer(
                'elevation', 'Elevation', 'ft', elevController),
            inputCircleContainer('purity', 'Purity', '%', purityController),
            inputCircleContainer(
                'humidity', 'Humidity', '%', humidityController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer(
                'hTempTO', 'Helium Temp TO', '°C', htempTOController),
            inputContainer(
                'hTempLD', 'Helium Temp LD', '°C', htempoLDController)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('fuelTO', 'Fuel TO', 'L', fuelTOController),
            inputContainer('fuelLD', 'Fuel LD', 'L', fuelLDController)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('oatTO', 'OAT TO', '°C', oatTOController),
            inputContainer('oatLD', 'OAT LD', '°C', oatLDController)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('qnhTO', 'QNH TO', 'hPa', qnhTOController),
            inputContainer('qnhLD', 'QNH LD', 'hPa', qnhLDController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('elevation', 'Elevation TO', 'ft', elevController),
            inputContainer('elevation', 'Elevation LD', 'ft', elevControllerLD),
          ],
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: body,
      ),
    );
  }

  Container inputCircleContainer(String varType, String varText,
      String hintText, TextEditingController controller) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
      child: Column(
        children: [
          Container(
            child: Text(
              varText,
              style: TextStyle(fontSize: height * .02),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .25,
            height: height * 0.045,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  )),
                ),
                controller: controller,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: height * .02),
                onChanged: (value) {
                  switch (varType) {
                    case 'elevation':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevation(
                                  double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevation(0.0);
                        }
                      }
                      break;

                    case 'purity':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provPurity(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provPurity(0.0);
                        }
                      }
                      break;
                    case 'humidity':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHumidity(
                                  double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHumidity(0.0);
                        }
                      }
                      break;
                  }
                }),
          )
        ],
      ),
    );
  }

  Container inputContainer(String varType, String varText, String hintText,
      TextEditingController controller) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
      child: Column(
        children: [
          Container(
            child: Text(
              varText,
              style: TextStyle(fontSize: height * .02),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .45,
            height: height * 0.045,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: controller,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: height * .02),
                onChanged: (value) {
                  switch (varType) {
                    case 'oatLD':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provOatLD(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provOatLD(0.0);
                        }
                      }
                      break;
                    case 'oatTO':
                      {
                        {
                          try {
                            Provider.of<DataProvider>(context, listen: false)
                                .provOatTO(double.parse(controller.value.text));
                          } on Exception catch (_) {
                            Provider.of<DataProvider>(context, listen: false)
                                .provOatLD(0.0);
                          }
                        }
                      }
                      break;
                    case 'elevation':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevation(
                                  double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevation(0.0);
                        }
                      }
                      break;
                    case 'elevationLD':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevationLD(
                                  double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provElevationLD(0.0);
                        }
                      }
                      break;
                    case 'purity':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provPurity(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provPurity(0.0);
                        }
                      }
                      break;
                    case 'humidity':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHumidity(
                                  double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHumidity(0.0);
                        }
                      }
                      break;
                    case 'hTempTO':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHtempTO(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHtempTO(0.0);
                        }
                      }
                      break;

                    case 'hTempLD':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHtempLD(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provHtempLD(0.0);
                        }
                      }
                      break;

                    case 'fuelTO':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFuelTO(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFuelTO(0.0);
                        }
                      }
                      break;

                    case 'qnhTO':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provQnhTO(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provQnhTO(0.0);
                        }
                      }
                      break;

                    case 'qnhLD':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provQnhLD(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provQnhLD(0.0);
                        }
                      }
                      break;

                    case 'fuelLD':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFuelLD(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFuelLD(0.0);
                        }
                      }
                      break;
                  }
                }),
          )
        ],
      ),
    );
  }
}
