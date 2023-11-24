import 'package:flutter/material.dart';

import '../../../core/design/design.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Deseja realmente excluir?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Sim',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              )),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Não',
              style: TextStyle(
                color: AppColors.secondaryGreen,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
