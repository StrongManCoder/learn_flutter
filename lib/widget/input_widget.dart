import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyBoardType;

  const InputWidget(this.hint,
      {Key? key, this.onChanged, this.obscureText = false, this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _input(),

        //分割线组件
        Divider(
          color: Colors.white,
          height: 1,
          thickness: 0.5,
        )
      ],
    );
  }

  _input() {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyBoardType,
      autofocus: !obscureText,
      cursorColor: Colors.white,
      style: const TextStyle(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
      //输入框样式
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 17, color: Colors.grey)),
    );
  }
}
