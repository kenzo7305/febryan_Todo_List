class Status {
  String title;
  bool isCompleted;   // <-- BAGIAN STATUS (Pending/Completed)

  Status(this.title, {this.isCompleted = false}); // default Pending
}
