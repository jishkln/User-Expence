import 'package:expencesapp/controller/transation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewTransation extends StatelessWidget {
  const NewTransation(this.addTransation, {super.key});
  final Function addTransation;

  @override
  Widget build(BuildContext context) {
    final newTConroller = Get.put(TransationController());

    return GetBuilder<TransationController>(builder: (context) {
      return Card(
        margin: const EdgeInsets.all(0),
        elevation: 15,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: newTConroller.titleInputController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                onSubmitted: (_) => newTConroller.submitData(),
              ),
              TextField(
                controller: newTConroller.amountInputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) => newTConroller.submitData(),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Text(
                      DateFormat.yMEd().format(newTConroller.selectedDate),
                    ),
                    TextButton(
                        onPressed: newTConroller.presentDatePicker,
                        child: const Text('Add Date'))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: newTConroller.submitData,
                child: const Text(
                  'Add Transaction',
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
