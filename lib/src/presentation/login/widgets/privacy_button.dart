import 'package:flutter/material.dart';
import 'package:prova_flutter/src/core/app_constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/design/design.dart';

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrlString(AppConstants.privacyPolicyUrl,
            mode: LaunchMode.externalApplication);
      },
      child: const Text(
        'Política de Privacidade',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
