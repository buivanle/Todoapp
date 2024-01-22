import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handledelete,
      required this.index})
      : super(key: key);
  var item;
  var index;
  final Function handledelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? Color.fromARGB(255, 202, 194, 194)
            : const Color.fromARGB(255, 223, 43, 43),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            item.name,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff4B4B4B),
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                return print('pressedOK');
              }
              return print('pressedCancel');
            },
            child: Icon(
              Icons.delete_outline,
              color: Color(0xff4B4B4B),
              size: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
