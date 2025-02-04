import 'package:flutter/material.dart';

class AdditionalConfirm extends StatefulWidget {
  final String contentText;
  final VoidCallback onYes,onNO;
  const AdditionalConfirm({super.key, required this.contentText, required this.onYes, required this.onNO, required Null Function() onNo});

  @override
  State<AdditionalConfirm> createState() => _AdditionalConfirmState();
}

class _AdditionalConfirmState extends State<AdditionalConfirm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure ?"),
      content: Text(widget.contentText),
      actions: [
        TextButton(onPressed: widget.onNO, child: Text("No")),
        TextButton(onPressed: widget.onYes, child: Text("Yes")),
      ],
    );
  }
}