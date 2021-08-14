import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wab_app/provider/data_provider.dart';

class TakeOffPage extends StatefulWidget {
  _TakeOffPageState createState() => _TakeOffPageState();
}

class _TakeOffPageState extends State<TakeOffPage>
    with AutomaticKeepAliveClientMixin<TakeOffPage> {
  @override
  bool get wantKeepAlive => true;

  final noseBagsController = TextEditingController();
  final boxBagsController = TextEditingController();
  final row1Controller = TextEditingController();
  final row2Controller = TextEditingController();
  final row3Controller = TextEditingController();
  final fwdMarkController = TextEditingController();
  final aftMarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget body = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('noseBag', 'Nose Bags', 'Qtd', noseBagsController),
            inputContainer('boxBag', 'Box Bags', 'Qtd', boxBagsController)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer(
                'fwdMark', 'Fwd Ballonet', 'Mark', fwdMarkController),
            inputContainer(
                'aftMark', 'Aft Ballonet', 'Mark', aftMarkController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('row1', 'Crew Row', 'kg', row1Controller),
            inputContainer('row2', 'Pax Row 2', 'kg', row2Controller),
            inputContainer('row3', 'Pax Row 3', 'kg', row3Controller),
          ],
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: body,
      ),
    );
  }

  Container inputContainer(String varType, String varText, String hintText,
      TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 2),
      child: Column(
        children: [
          Container(
            child: Text(varText),
          ),
          Container(
            width: 150,
            height: 50,
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: hintText,
                    border: OutlineInputBorder(),
                    hintText: hintText),
                controller: controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  switch (varType) {
                    case 'noseBag':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provNoseBag(int.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provNoseBag(0);
                        }
                      }
                      break;
                    case 'boxBags':
                      {
                        {
                          try {
                            Provider.of<DataProvider>(context, listen: false)
                                .provBoxBag(int.parse(controller.value.text));
                          } on Exception catch (_) {
                            Provider.of<DataProvider>(context, listen: false)
                                .provBoxBag(0);
                          }
                        }
                      }
                      break;
                    case 'row1':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow1(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow1(0.0);
                        }
                      }
                      break;
                    case 'row2':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow2(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow2(0.0);
                        }
                      }
                      break;
                    case 'row3':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow3(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provRow3(0.0);
                        }
                      }
                      break;
                    case 'fwdMark':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFwdMark(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provFwdMark(0.0);
                        }
                      }
                      break;
                    case 'aftMark':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provAftMark(double.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provAftMark(0.0);
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
