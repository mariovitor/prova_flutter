import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/src/core/core.dart';

void main() {
  group('Validator tests', () {
    test('USERNAME should pass min 2 characteres', () {
      AppValidators.validateMin2Characters('USERNAME');
    });
    test('should fail min 2 characteres', () {
      try {
        AppValidators.validateMin2Characters('U');
        expect(false, true);
      } catch (e) {
        expect(true, true);
      }
    });
    test('USERNAME should pass max 20 characteres', () {
      AppValidators.validateMax20Characters('USERNAME');
    });
    test('should fail max 20 characteres', () {
      try {
        AppValidators.validateMax20Characters(
            'USERNAMEUSERNAMEUSERNAMEUSERNAMEUSERNAMEUSER');
        expect(false, true);
      } catch (e) {
        expect(true, true);
      }
    });

    test('USERNAME should pass space at end', () {
      AppValidators.validateSpaceAtEnd('USERNAME');
    });
    test('should fail space at end', () {
      try {
        AppValidators.validateSpaceAtEnd('USERNAME ');
        expect(false, true);
      } catch (e) {
        expect(true, true);
      }
    });

    test('USERNAME should pass only letters and numbers', () {
      AppValidators.validatePassword('USERNAME');
    });
    test('should fail only letters and numbers', () {
      try {
        AppValidators.validatePassword('USERNAME@');
        expect(false, true);
      } catch (e) {
        expect(true, true);
      }
    });
  });
}
