import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final dynamic Function(Function, Function, ButtonState)? onTap;
  const PrimaryButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: 55,
      width: 300,
      borderRadius: 8.0,
      loader: Container(
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
