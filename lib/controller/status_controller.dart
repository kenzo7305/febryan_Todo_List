import 'package:get/get.dart';
import '../status/status.dart';

class StatusController extends GetxController {
  var status = <Status>[].obs;

//ini juga buat testing aja nanti dibuat aja addnya
void addTodo(String title) {
    status.add(Status(title));
  }

  void toggleStatus(int index) {
    status[index].isCompleted = !status[index].isCompleted; // <-- MENGUBAH STATUS
    status.refresh(); // update UI
  }
}
