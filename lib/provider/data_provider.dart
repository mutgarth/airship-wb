import 'package:flutter/cupertino.dart';
import 'package:wab_app/utilities/airship.dart';

class DataProvider extends ChangeNotifier {
  Airship airship = new Airship();

  //TO

  void provNoseBag(int value) {
    airship.noseBags = value;
    notifyListeners();
  }

  void provBoxBag(int value) {
    airship.boxBags = value;
    notifyListeners();
  }

  void provRow1(double value) {
    airship.row1Weight = value;
    notifyListeners();
  }

  void provRow2(double value) {
    airship.row2Weight = value;
    notifyListeners();
  }

  void provRow3(double value) {
    airship.row3Weight = value;
    notifyListeners();
  }

  void provFwdMark(double value) {
    airship.fwdMark = value;
    notifyListeners();
  }

  void provAftMark(double value) {
    airship.aftMark = value;
    notifyListeners();
  }

  void provBagsToEq(int value) {
    airship.bagsToEq = value;
    notifyListeners();
  }

  void provBagsAddToBox(int value) {
    airship.bagsAddToBox = value;
    notifyListeners();
  }

  //ENV

  void provQnhTO(double value) {
    airship.qnhTO = value;
    notifyListeners();
  }

  void provQnhLD(double value) {
    airship.qnhLD = value;
    notifyListeners();
  }

  void provFuelTO(double value) {
    airship.setFuelTO = value;
    notifyListeners();
  }

  void provHtempTO(double value) {
    airship.setHtempTO = value;
    notifyListeners();
  }

  void provHtempLD(double value) {
    airship.setHtempLD = value;
    notifyListeners();
  }

  void provHumidity(double value) {
    airship.setHumidity = value;
    notifyListeners();
  }

  void provOatLD(double value) {
    airship.setOatLD = value;
    notifyListeners();
  }

  void provOatTO(double value) {
    airship.setOatTO = value;
    notifyListeners();
  }

  void provPurity(double value) {
    airship.setPurity = value;
    notifyListeners();
  }

  void provElevation(double value) {
    airship.setElevation = value;
    notifyListeners();
  }

  void provElevationLD(double value) {
    airship.elevationLD = value;
    notifyListeners();
  }

  //LND

  void provFuelLD(double value) {
    airship.setFuelLD = value;
    notifyListeners();
  }

  double provPressureHeight() {
    return airship.pressureHeight();
  }

  double provTotalSuspendedWeight() {
    return airship.totalSuspendedWeight();
  }

  double provTotalGrossWeight() {
    return airship.totalGrossWeight();
  }

  double provCG() {
    return airship.cgCalc();
  }

  int provAcceptedTO() {
    return airship.accTOCondition();
  }

  double provResultantLD() {
    return airship.resultLDCondition();
  }

  double provTeste() {
    return airship.teste();
  }
}
