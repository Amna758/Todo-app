// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:crudapp/constants/colors.dart';
import 'package:crudapp/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ontodochange;
  final ondeleteitem;
  const TodoItem({
    Key? key,
    required this.todo,
    required this.ontodochange,
    required this.ondeleteitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 3),
        child: ListTile(
          onTap: () {
            ontodochange(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: white,
          leading: Icon(
            todo.isdon ? Icons.check_box : Icons.check_box_outline_blank,
            color: blue,
          ),
          title: Text(
            todo.todotext!,
            style: TextStyle(
                fontSize: 16,
                color: black,
                decoration: todo.isdon ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: red),
            child: IconButton(
              onPressed: () {
                ondeleteitem(todo.id);
              },
              icon: const Icon(Icons.delete),
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
