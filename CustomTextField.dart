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
    this.maxLines,
    this.minLines,
    required this.highlightUserInput,
    this.initialText,
  });

  final double? width;
  final double? height;
  final int? maxLines;
  final int? minLines;
  final bool highlightUserInput;
  final String? initialText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                letterSpacing: 0,
              ),
          alignLabelWithHint: true,
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                letterSpacing: 0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
          border: InputBorder.none,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Outfit',
              letterSpacing: 0,
            ),
        TextStyle(
          backgroundColor: widget.highlightUserInput ? Colors.yellow : null,
        ),
        cursorColor: FlutterFlowTheme.of(context).primary,
      ),
    );
  }
}
