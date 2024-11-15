import '../constants/colors.dart';
import 'package:crudapp/model/todo.dart';
import '../widgets/Todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoslist = Todo.todolist();
  TextEditingController todocontroller = TextEditingController();
  List<Todo> _foundtodo = [];
  @override
  void initState() {
    _foundtodo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: offwhite,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: black,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/th (1).jpg"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      onChanged: (value) => _Runfilter(value),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: black,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, maxWidth: 25),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 64, 67, 70),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: const Text(
                            "All ToDo",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      for (Todo todo in _foundtodo.reversed)
                        TodoItem(
                          todo: todo,
                          ontodochange: _handletodochange,
                          ondeleteitem: _ondeleteitem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: todocontroller,
                          decoration: const InputDecoration(
                            hintText: "Add new item",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _addtodoitem(todocontroller.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 24,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handletodochange(Todo todo) {
    setState(() {
      todo.isdon = !todo.isdon;
    });
  }

  void _ondeleteitem(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoitem(String toDo) {
    setState(() {
      todoslist.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    todocontroller.clear();
  }

  void _Runfilter(String Enteredkeyword) {
    List<Todo> results = [];
    if (Enteredkeyword.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(Enteredkeyword.toLowerCase()))
          .toList();
      setState(() {
        _foundtodo = results;
      });
    }
  }
}
