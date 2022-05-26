import 'package:flutter/material.dart';
import 'package:todo_apps/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();
    AppBar myAppbar = AppBar(
      title: const Text('Todo App'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerTitle.text.isNotEmpty ||
              controllerDescription.text.isNotEmpty) {
            dataTodo.add(
              Todo(
                id: DateTime.now().toString(),
                desc: controllerDescription.text.isEmpty
                    ? 'No Description'
                    : controllerDescription.text,
                title: controllerTitle.text.isEmpty
                    ? 'No Titile'
                    : controllerTitle.text,
              ),
            );
          }
          print(dataTodo);
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.add_task,
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: myAppbar,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white12,
                ),
                child: TextField(
                  controller: controllerTitle,
                  maxLength: 10,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: heightBody * 0.05,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white12,
                ),
                child: TextField(
                  controller: controllerDescription,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
