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
  double fonteSize1 = 2;
  double fonteSize2 = 2;
  double fontFactor = 0.02;

  final bagsToEqController = TextEditingController();
  final bagsAddtoBoxController = TextEditingController();

  Container cg() {
    double height = MediaQuery.of(context).size.height;
    double cgValue = Provider.of<DataProvider>(context).provCG();
    if (cgValue < 840 || cgValue > 872) {
      return Container(
          padding: EdgeInsets.all(edgeValue),
          child: Row(
            children: [
              Text(
                'CG: ' + cgValue.toStringAsFixed(2) + ' in',
                style: TextStyle(
                    fontSize: height * fontFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ));
    } else {
      return Container(
          padding: EdgeInsets.all(edgeValue),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'CG: ',
                    style: TextStyle(
                        fontSize: height * fontFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    cgValue.toStringAsFixed(2) + ' in',
                    style: TextStyle(
                        fontSize: height * fontFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              )
            ],
          ));
    }
  }

  Container totalSuspendedWeight() {
    double height = MediaQuery.of(context).size.height;
    double tsw = Provider.of<DataProvider>(context).provTotalSuspendedWeight();
    if (tsw < 2430) {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'TSW: ' + tsw.toStringAsFixed(2) + ' kg',
          style: TextStyle(
              fontSize: height * fontFactor,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          'TSW: ' + tsw.toStringAsFixed(2),
          style: TextStyle(
              fontSize: height * fontFactor,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        ),
      );
    }
  }

  Container totalGrossWeight() {
    double height = MediaQuery.of(context).size.height;
    double tgw = Provider.of<DataProvider>(context).provTotalGrossWeight();
    if (tgw > 3028 || tgw < 4041) {
      return Container(
        padding: EdgeInsets.all(edgeValue),
        child: Text(
          ' TGW: ' + tgw.toStringAsFixed(2) + ' kg',
          style: TextStyle(
              fontSize: height * fontFactor,
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
    double height = MediaQuery.of(context).size.height;
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
                  style: TextStyle(
                      fontSize: height * fontFactor, color: Colors.black),
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
                    fontSize: height * fontFactor,
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
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(edgeValue),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Accepted TO',
                style: TextStyle(
                    fontSize: height * fontFactor, color: Colors.black54),
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
                    fontSize: height * fontFactor,
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
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(edgeValue),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Resultant LD',
                style: TextStyle(
                    fontSize: height * fontFactor, color: Colors.black54),
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
                    fontSize: height * fontFactor,
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
        Column(
          children: [
            resultantLDCondition(),
            accpetedTOCondition(),
          ],
        ),
        Column(
          children: [
            inputContainer('bagsToEq', 'Bags to Eq', 'Qtd', bagsToEqController),
            inputContainer('bagsAddToBox', 'Bags Add to Box', 'Qtd',
                bagsAddtoBoxController),
          ],
        )
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

  Container inputContainer(String varType, String varText, String hintText,
      TextEditingController controller) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 2),
      child: Column(
        children: [
          Container(
            child: Text(
              varText,
              style: TextStyle(fontSize: height * 0.02),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .2,
            height: height * 0.05,
            child: TextFormField(
                style: TextStyle(fontSize: height * 0.02),
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
