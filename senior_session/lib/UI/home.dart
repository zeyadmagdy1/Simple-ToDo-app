import 'package:flutter/material.dart';
import 'package:senior_session/UI/customTextField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var task = TextEditingController();
  var taskDetails = TextEditingController();
  List<MyTask> myTasks = [
    MyTask(task: "task one", taskDetails: "project flutter")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: myTasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(22)),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            myTasks[index].task,
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                          Text(
                            myTasks[index].taskDetails,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              myTasks.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 35,
                            color: Colors.red,
                          )),
                    ],
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void modalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.cancel)),
                    ],
                  ),
                  const Text(
                    "New Task",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  CustomTextField(txt: "Task...", controller: task),
                  CustomTextField(
                    txt: "Task Details...",
                    number: 4,
                    controller: taskDetails,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (task.text.trim() == "" ||
                            taskDetails.text.trim() == "") {
                          return;
                        }
                        setState(() {
                          myTasks.add(MyTask(
                              task: task.text, taskDetails: taskDetails.text));
                        });
                        task.text = "";
                        taskDetails.text = "";
                        Navigator.pop(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text("Add Task"),
                        ],
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyTask {
  String task;
  String taskDetails;
  MyTask({required this.task, required this.taskDetails});
}
