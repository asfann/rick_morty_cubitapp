
import 'package:flutter/material.dart';

class AdvancedButton extends StatelessWidget {
  const AdvancedButton({
    Key? key, required this.onPressed,
  }) : super(key: key);
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
      child: MaterialButton(
        onPressed: onPressed,
        height: 40,
        color: Color(0xFFE3F2FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: const [
            Icon(Icons.menu),
            SizedBox(width: 90),
            Text(
              'ADVANCED FILTER',
              style: TextStyle(
                color: Color(0xFF2196F3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
