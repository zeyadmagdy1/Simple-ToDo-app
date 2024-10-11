import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String txt;
  int? number;
  CustomTextField({required this.txt, this.number, required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller:controller ,
        minLines: number,
        maxLines: null,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            label: Text(txt)),
      ),
    );
  }
}
