import 'package:flutter/material.dart';

Widget customTextController({required String hintText, required TextEditingController controller, required BuildContext context, required Function onSubmitted}) {
  return TextField(
    controller: controller,
    onSubmitted: (_) => onSubmitted(context),
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(
          vertical: 10, horizontal: 12), // ⬅️ reduce height
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
