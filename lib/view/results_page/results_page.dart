import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wab_app/provider/data_provider.dart';

class ResultsPage extends StatefulWidget {
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage>
    with AutomaticKeepAliveClientMixin<ResultsPage> {
  @override
  bool get wantKeepAlive => true;

  double edgeValue = 10;
  double fonteSize1 = 45;
  double fonteSize2 = 35;

  final bagsToEqController = TextEditingController();
  final bagsAddtoBoxController = TextEditingController();

  Container cg() {
    double cgValue = Provider.of<DataProvider>(context).provCG();
    if (cgValue < 840 || cgValue > 872) {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'CG: ' + cgValue.toStringAsFixed(2) + ' in',
          style: TextStyle(
              fontSize: fonteSize1,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'CG: ' + cgValue.toStringAsFixed(2) + ' in',
          style: TextStyle(
              fontSize: fonteSize1,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      );
    }
  }

  Container totalSuspendedWeight() {
    double tsw = Provider.of<DataProvider>(context).provTotalSuspendedWeight();
    if (tsw < 2430) {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'TSW: ' + tsw.toStringAsFixed(2) + ' kg',
          style: TextStyle(
              fontSize: fonteSize2,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'Total Suspended Weight: ' + tsw.toStringAsFixed(2),
          style: TextStyle(
              fontSize: fonteSize2,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        ),
      );
    }
  }

  Container totalGrossWeight() {
    double tgw = Provider.of<DataProvider>(context).provTotalGrossWeight();
    if (tgw > 3028 || tgw < 4041) {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          ' TGW: ' + tgw.toStringAsFixed(2) + ' kg',
          style: TextStyle(
              fontSize: fonteSize2,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'Total Gross Weight: ' + tgw.toStringAsFixed(2),
          style: TextStyle(color: Colors.black38),
        ),
      );
    }
  }

  Container pressureHeight() {
    return Container(
      padding: EdgeInsets.all(edgeValue),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Pressure Height',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                Provider.of<DataProvider>(context)
                        .provPressureHeight()
                        .toStringAsFixed(2) +
                    ' ft',
                style: TextStyle(
                    fontSize: fonteSize2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container accpetedTOCondition() {
    return Container(
      padding: EdgeInsets.all(edgeValue),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Accepted TO',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                Provider.of<DataProvider>(context)
                        .provAcceptedTO()
                        .toStringAsFixed(2) +
                    ' kg',
                style: TextStyle(
                    fontSize: fonteSize2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container resultantLDCondition() {
    return Container(
      padding: EdgeInsets.all(edgeValue),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Resultant LD',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                Provider.of<DataProvider>(context)
                        .provResultantLD()
                        .toStringAsFixed(2) +
                    ' kg',
                style: TextStyle(
                    fontSize: fonteSize2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget body = Row(
      children: [
        Column(
          children: [
            cg(),
            totalGrossWeight(),
            totalSuspendedWeight(),
            pressureHeight(),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 35.0),
            padding: const EdgeInsets.all(15),
            height: 300,
            child: VerticalDivider(color: Colors.blue)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputContainer('bagsToEq', 'Bags to Eq', 'Qtd', bagsToEqController),
            inputContainer('bagsAddToBox', 'Bags Add to Box', 'Qtd',
                bagsAddtoBoxController),
            resultantLDCondition(),
            accpetedTOCondition(),
          ],
        ),
        Container(
            padding: const EdgeInsets.all(15),
            height: 300,
            child: VerticalDivider(color: Colors.blue)),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Data'),
              ),
            ),
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
      padding: const EdgeInsets.only(top: 2, left: 2),
      child: Column(
        children: [
          Container(
            child: Text(varText),
          ),
          Container(
            width: 150,
            height: 40,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: hintText),
                controller: controller,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  switch (varType) {
                    case 'bagsToEq':
                      {
                        try {
                          Provider.of<DataProvider>(context, listen: false)
                              .provBagsToEq(int.parse(controller.value.text));
                        } on Exception catch (_) {
                          Provider.of<DataProvider>(context, listen: false)
                              .provBagsToEq(0);
                        }
                      }
                      break;
                    case 'bagsAddToBox':
                      {
                        {
                          try {
                            Provider.of<DataProvider>(context, listen: false)
                                .provBagsAddToBox(
                                    int.parse(controller.value.text));
                          } on Exception catch (_) {
                            Provider.of<DataProvider>(context, listen: false)
                                .provBagsAddToBox(0);
                          }
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
