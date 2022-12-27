import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../widgets/new_transation.dart';

class TransationController extends GetxController {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final List<Transaction> userTransations = [];
  bool isDark = false;

  DateTime selectedDate = DateTime.now();

  void changeTheme(bool value) {
    if (value == true) {
      isDark = !isDark;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      isDark = !isDark;
      Get.changeThemeMode(ThemeMode.light);
    }
    update();
  }

  List<Transaction> get resntTransation {
    return userTransations.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  //================

  void addTransation(String txTitle, double txAmount, DateTime pickedDate) {
    final data = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        price: txAmount,
        date: pickedDate);

    userTransations.add(data);
    update();
  }

  //==================add Transation

  void addNewTransation() {
    Get.bottomSheet(BottomSheet(
        onClosing: () {},
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransation(addTransation),
          );
        }));
  }
  //============NewTransation function

  void submitData() {
    if (amountInputController.text.isEmpty) {
      return;
    }
    final titleU = titleInputController.text;
    final amountU = double.parse(amountInputController.text);
    if (titleU.isEmpty || amountU <= 0 || selectedDate == null) {
      return;
    } else {
      addTransation(
        titleU,
        amountU,
        selectedDate,
      );
    }
    Get.back();
    titleInputController.clear();
    amountInputController.clear();
  }

  presentDatePicker() {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      selectedDate = value;
      update();
    });
  }

  //================Chart

  List<Map<String, Object>> get groupedTransationValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.00;
      for (var i = 0; i < resntTransation.length; i++) {
        if (resntTransation[i].date.day == weekDay.day &&
            resntTransation[i].date.month == weekDay.month &&
            resntTransation[i].date.year == weekDay.year) {
          totalsum += resntTransation[i].price;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalsum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransationValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  //==========delete

  void deleteTransation(String id) {
    userTransations.removeWhere((element) => element.id == id);
    update();
  }
}
