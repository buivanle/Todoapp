import 'package:flutter/material.dart';
import 'package:todoapp/model/items.dart';
import 'package:todoapp/widget/card_button.dart';
import 'widget/card_body.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItem> items = [];

  void _handleAddTack(String name) {
    final newItem = DataItem(id: DateTime.now().toString(), Name: name);

    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTack(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuil');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ToDoApp",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            children: items
                .map((item) => CardBody(
                      index: items.indexOf(item),
                      item: item,
                      handledelete: _handleAddTack,
                    ))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return cart_button(addTack: _handleAddTack);
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
    );
  }
}
