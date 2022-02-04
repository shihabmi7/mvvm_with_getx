import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class DashboardWidget extends GetView<DashboardController> {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: controller.obx((data) => Center(
          child: ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(data[index].title),
                        subtitle: Text(data[index].title),
                        // leading: CircleAvatar(
                        //   backgroundImage:
                        //       NetworkImage(data[index]['picture']['thumbnail']),
                        // ),
                      ),
                    ],
                  ),
                );
              }))),
    );
  }
}
