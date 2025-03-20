import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        onPressed();
      },
      child: CustomText(
          txtTitle: text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
