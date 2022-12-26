import 'dart:developer';

import 'package:expencesapp/controller/transation_controller.dart';
import 'package:expencesapp/widgets/chart.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './widgets/transtion_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(TransationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('B N U'),
        actions: [
          GetBuilder<TransationController>(builder: (_) {
            return Switch(
              value: homeController.isDark,
              onChanged: (value) {
                homeController.changeTheme(value);
                log('message $value');
              },
            );
            // IconButton(
            //   onPressed: () => homeController.addNewTransation(),
            //   icon: const Icon(Icons.add),
            // );
          })
        ],
      ),
      body: GetBuilder<TransationController>(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Chart(),
              TransationList(
                userTransation: homeController.userTransations,
              ),
            ],
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => homeController.addNewTransation(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
