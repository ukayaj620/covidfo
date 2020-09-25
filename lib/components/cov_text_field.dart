import 'package:flutter/material.dart';

class CovTextField extends StatelessWidget {

  CovTextField({
    @required this.hint,
    @required this.inputType,
    @required this.secure,
    @required this.onChanged,
  });
  final String hint;
  final TextInputType inputType;
  final bool secure;
  final ValueChanged<String> onChanged;

  static const TextStyle _textStyle = TextStyle(fontFamily: 'Roboto', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: TextField(
        onChanged: onChanged,
        keyboardType: this.inputType,
        autofocus: true,
        style: _textStyle,
        obscureText: secure,
        decoration: InputDecoration(
          hintText: this.hint,
          labelText: this.hint,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}