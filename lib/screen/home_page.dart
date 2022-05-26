import 'package:flutter/material.dart';
import 'package:todo_apps/model/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
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
      resizeToAvoidBottomInset: false,
      appBar: myAppbar,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: 'Search your task..',
                ),
              ),
              width: widhtBody,
              height: heightBody * 0.15,
            ),
            SizedBox(
              height: heightBody * 0.85,
              width: widhtBody,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return CheckboxListTile(
                    secondary: IconButton(
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todo.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        todo.isCompleted = value!;
                      });
                    },
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 18,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      todo.desc,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
