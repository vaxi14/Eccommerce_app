import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const HomeButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          onTap(); // Ensure this call is valid
        } catch (e) {
          debugPrint('Error during onTap: $e');
        }
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * .42,
        margin: EdgeInsets.all(8), // Adjusted to avoid large margins
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[400],
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
