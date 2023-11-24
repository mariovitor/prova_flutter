import 'dart:math';

enum Reasons {
  empty('Campo obrigatorio'),
  spaceAtEnd('Não pode conter espaço no final'),
  maxCharacters('Máximo de 20 caracteres'),
  minCharacters('Mínimo de 2 caracteres'),
  onlyLettersAndNumbers('Apenas letras e números'),
  ;

  const Reasons(this.message);
  final String message;
}

abstract final class AppValidators {
  static String? validateUsername(String? username) {
    try {
      validateNotNull(username);
      validateMax20Characters(username!);
      validateSpaceAtEnd(username);
      return null;
    } on _ValidatorError catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  static String? validatePassword(String? password) {
    try {
      validateNotNull(password);
      validateMin2Characters(password!);
      // _validateSpaceAtEnd(password);
      validateMax20Characters(password);
      final invalidCharacters = RegExp(r'[^a-zA-Z0-9]');
      if (invalidCharacters.hasMatch(password)) {
        return Reasons.onlyLettersAndNumbers.message;
      }
      return null;
    } on _ValidatorError catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  static void validateNotNull(String? value) {
    if (value == null || value.isEmpty) {
      throw _ValidatorError(Reasons.empty.message);
    }
  }

  static void validateMax20Characters(String value) {
    if (value.length > 20) {
      throw _ValidatorError(Reasons.maxCharacters.message);
    }
  }

  static void validateMin2Characters(String value) {
    if (value.length < 2) {
      throw _ValidatorError(Reasons.minCharacters.message);
    }
  }

  static void validateSpaceAtEnd(String value) {
    if (value.endsWith(' ')) {
      throw _ValidatorError(Reasons.spaceAtEnd.message);
    }
  }
}

class _ValidatorError {
  _ValidatorError(this.message);

  final String message;
}
