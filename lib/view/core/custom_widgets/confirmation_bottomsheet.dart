import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';

class ConfirmationBottomSheet extends StatefulWidget {
  const ConfirmationBottomSheet(
      {super.key,
      required this.hintText,
      required this.radius,
      required this.text});
  final String hintText;
  final String text;

  final double radius;
  @override
  State<ConfirmationBottomSheet> createState() =>
      _ConfirmationBottomSheetState();
}

class _ConfirmationBottomSheetState extends State<ConfirmationBottomSheet> {
  var textController = TextEditingController();
  var codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.blackText),
              ),
            ),
          ),
          CustomTextFormField(
              controller: textController,
              hintText: widget.hintText,
              radius: widget.radius),
          CustomButton(
              text: 'Press to send Code',
              color: AppTheme.primarylight,
              radius: 5,
              height: 50,
              width: 200),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter Code',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.blackText),
              ),
            ),
          ),
          CustomTextFormField(
              controller: codeController, hintText: '', radius: widget.radius),
          CustomButton(
              text: 'Verify',
              color: AppTheme.primarylight,
              radius: 5,
              height: 50,
              width: 130)
        ],
      ),
    );
  }
}
