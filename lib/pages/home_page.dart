import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_list_app/controller/status_controller.dart';

class HomePage extends StatelessWidget {
  final List<String> tasks = [
    "Learn programming",
    "Pick up kids",
    "Lunch",
    "Go visit mom"
  ];
  final StatusController controller = Get.put(StatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang Di Aplikasi Todo List"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Obx(() => ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: controller.status.length,
        itemBuilder: (context, index) {
          final tasks = controller.status[index];
          return Card(
            child: ListTile(
              //leading: Icon(Icons.check_box_outline_blank),
              title: Text(
                tasks.title,
                style: TextStyle(
                  decoration: tasks.isCompleted
                  ? TextDecoration.lineThrough
                  : null
                ),
              ),
              trailing: Checkbox(value: tasks.isCompleted, onChanged: (_) => controller.toggleStatus(index)
              ),
            ),
          );
        },
      )),
      // buat testing aja nanti tinggal di ubah pakai add kalau codingan addnya sudah dibikin
      // addTodo itu ada di status_controller itu aku tambahin biar ini bisa jalan
      // kalau udah jadi codingan addnya tinggal di hapus saja
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addTodo("Tugas Baru");
        },
        child: Icon(Icons.add)
      )
    );
  }
}