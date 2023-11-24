import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/controllers/home_controller.dart';
import 'package:prova_flutter/src/core/core.dart';
import 'package:prova_flutter/src/presentation/home/dialogs/confirm_delete_dialog.dart';
import 'package:prova_flutter/src/presentation/home/dialogs/edit_dialog.dart';
import 'package:prova_flutter/src/presentation/login/widgets/custom_form_field.dart';
import 'package:prova_flutter/src/presentation/login/widgets/privacy_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const pageName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  int? editingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryGreen,
              AppColors.secondaryGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: Observer(builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Card(
                    child: ListView.separated(
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: controller.texts.length,
                        itemBuilder: (_, i) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            title: Row(
                              children: [
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    controller.texts[i],
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      final newValue = await showDialog(
                                          context: context,
                                          builder: (_) {
                                            return EditDialog(
                                                value: controller.texts[i]);
                                          });
                                      if (newValue is String) {
                                        controller.addText(newValue, index: i);
                                      }
                                      focus.requestFocus();
                                    },
                                    icon: const Icon(Icons.edit)),
                                InkWell(
                                  onTap: () async {
                                    final delete = await showDialog<bool>(
                                        context: context,
                                        builder: (_) {
                                          return const ConfirmDeleteDialog();
                                        });
                                    if (delete == true) {
                                      controller.deleteText(i);
                                    }
                                    focus.requestFocus();
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.red,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Form(
                  key: formKey,
                  child: CustomFormField(
                    label: '',
                    controller: textController,
                    textAlign: TextAlign.center,
                    hintText: 'Digite seu texto',
                    focusNode: focus,
                    onSubmitted: (v) {
                      if (!(formKey.currentState?.validate() ?? false)) {
                        focus.requestFocus();
                        return;
                      }
                      controller.addText(v);
                      textController.clear();
                      focus.requestFocus();
                    },
                    validator: (v) {
                      try {
                        AppValidators.validateNotNull(v?.trim());
                        return null;
                      } catch (e) {
                        return e.toString();
                      }
                    },
                  ),
                ),
                const Spacer(),
                const PrivacyButton(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
