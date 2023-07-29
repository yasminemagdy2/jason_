import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  final String label;
  final void Function()? onTap;
  final Color? buttonColor;
  const MyCustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.buttonColor,
  });

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: widget.buttonColor ?? Color(0xff3649f4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
