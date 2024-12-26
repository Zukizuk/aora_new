import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  bool isLoading = false;

  GradientButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 327,
        child: isLoading
            ? CircularProgressIndicator(
                color: AppColors.background,
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
