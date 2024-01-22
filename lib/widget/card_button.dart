import 'package:flutter/material.dart';

class cart_button extends StatelessWidget {
  cart_button({Key? key, required this.addTack}) : super(key: key);
  final Function addTack;
  TextEditingController controller = TextEditingController();
  void _handelonclick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTack(name);
    Navigator.pop(context); //trả về màn hình trước đó
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Your tack'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handelonclick(context),
                child: Text("Add Tack"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
