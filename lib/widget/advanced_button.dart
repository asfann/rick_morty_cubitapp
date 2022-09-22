
import 'package:flutter/material.dart';

class AdvancedButton extends StatelessWidget {
  const AdvancedButton({
    Key? key, required this.onPressed, required this.text, this.show=false,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final bool show;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
      child: MaterialButton(
        onPressed: onPressed,
        height: 40,
        color: const Color(0xFFE3F2FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children:  [
          show ? const Icon(Icons.menu):const SizedBox(),
            const SizedBox(width: 90),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF2196F3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
