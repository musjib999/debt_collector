import 'package:flutter/material.dart';

class DialogService{
  void showSuccessSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children:  [
            const Icon(
              Icons.done,
              color: Colors.green,
            ),
            const SizedBox(width: 8.0),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}