import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginBtn(this.title, {Key? key, this.enable = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 45,
      onPressed: enable ? onPressed : null,
      disabledColor: Colors.grey,
      color: Colors.orange,
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
