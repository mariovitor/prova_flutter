// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prova_flutter/src/presentation/login/widgets/custom_form_field.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({
    Key? key,
    required this.value,
  }) : super(key: key);
  final String value;
  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late final textController = TextEditingController(text: widget.value);
  void onSubmitted([String? v]) {
    Navigator.of(context).pop(v ?? textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Altere o valor e salve'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CustomFormField(
                controller: textController,
                onSubmitted: onSubmitted,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: onSubmitted,
                  child: const Text('Salvar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
