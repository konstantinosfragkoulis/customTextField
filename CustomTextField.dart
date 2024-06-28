// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.width,
    this.height,
    required this.autofocus,
    required this.obscureText,
    this.maxLines,
    this.minLines,
    this.cursorColor,
    required this.highlightUesrInput,
    this.controller,
    this.textStyle,
    this.highlightStyle,
  });

  final double? width;
  final double? height;
  final bool autofocus;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final Color? cursorColor;
  final bool highlightUesrInput;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateText);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateText);
    super.dispose();
  }

  void _updateText() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.controller.text;
    List<TextSpan> spans = [];
    int startIndex = 0;

    while (startIndex < text.length) {
      int asteriskStart = text.indexOf('*', startIndex);
      if (asteriskStart == -1) {
        spans.add(TextSpan(
            text: text.substring(startIndex), style: widget.textStyle));
        break;
      }
      int asteriskEnd = text.indexOf('*', asteriskStart + 1);
      if (asteriskEnd == -1) {
        spans.add(TextSpan(
            text: text.substring(startIndex), style: widget.textStyle));
        break;
      }

      if (asteriskStart > startIndex) {
        spans.add(TextSpan(
            text: text.substring(startIndex, asteriskStart),
            style: widget.textStyle));
      }
      spans.add(TextSpan(
          text: text.substring(asteriskStart, asteriskEnd + 1),
          style: widget.highlightStyle));
      startIndex = asteriskEnd + 1;
    }

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter text with *asterisks* to highlight',
      ),
      style: widget.textStyle,
      maxLines: null,
      minLines: 1,
      buildCounter: (BuildContext context,
          {int currentLength, bool isFocused, int maxLength}) {
        return RichText(
          text: TextSpan(children: spans),
        );
      },
    );
  }
}
