import '../widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transation_controller.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });
  //final List<Transaction> resentTransations;

  @override
  Widget build(BuildContext context) {
    final chartConroller = Get.put(TransationController());

    return GetBuilder<TransationController>(builder: (_) {
      return Card(
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: chartConroller.groupedTransationValue.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: (data['day'] as String),
                    spendingAmount: (data['amount'] as double),
                    prodectTotal: chartConroller.totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) /
                            chartConroller.totalSpending),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
