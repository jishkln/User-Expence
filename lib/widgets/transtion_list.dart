import 'package:expencesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/transation_controller.dart';

class TransationList extends StatelessWidget {
  const TransationList({super.key, required this.userTransation});
  final List<Transaction> userTransation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final conroller = Get.put(TransationController());
    return SizedBox(
      width: double.infinity,
      height: size.height * .7,
      child: userTransation.isEmpty
          ? Center(
              child: Text(
                'No Data',
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                        '\$${userTransation[index].price.toStringAsFixed(2)}',
                      ),
                    ),
                  ),
                ),
                title: Text(
                  userTransation[index].title.toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  DateFormat.yMEd().format(userTransation[index].date),
                ),
                trailing: IconButton(
                  onPressed: () =>
                      conroller.deleteTransation(userTransation[index].id),
                  icon: const Icon(Icons.delete),
                ),
              ),
              itemCount: userTransation.length,
            ),
    );
  }
}
