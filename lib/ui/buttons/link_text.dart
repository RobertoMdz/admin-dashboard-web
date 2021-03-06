import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LinkText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const LinkText({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
