import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  group('Validators Test - Latihan 5', () {
    // a) Test isValidEmail() dengan berbagai skenario
    group('isValidEmail', () {
      test('mengembalikan true untuk email valid', () {
        expect(Validators.isValidEmail('user@example.com'), isTrue);
        expect(Validators.isValidEmail('habib.zikri@amikom.ac.id'), isTrue);
      });

      test('mengembalikan false untuk email tidak valid', () {
        expect(Validators.isValidEmail('userexample.com'), isFalse);
        expect(Validators.isValidEmail('user@'), isFalse);
        expect(Validators.isValidEmail(''), isFalse);
      });
    });

    // b) Test sanitize() dengan input berbahaya (XSS)
    group('sanitize', () {
      test('mengubah karakter HTML berbahaya menjadi entity aman', () {
        final input = '<script>alert("xss")</script>';
        final expected = '&lt;script&gt;alert(&quot;xss&quot;)&lt;/script&gt;';
        expect(Validators.sanitize(input), equals(expected));
      });

      test('menghapus spasi di awal dan akhir (trim)', () {
        final input = '  hello world  ';
        expect(Validators.sanitize(input), equals('hello world'));
      });
    });

    // c) Test validateText() dengan berbagai panjang
    group('validateText', () {
      test('mengembalikan error jika teks kosong', () {
        final result = Validators.validateText('', fieldName: 'Nama');
        expect(result, equals('Nama tidak boleh kosong'));
      });

      test('mengembalikan error jika teks kurang dari minLength', () {
        final result = Validators.validateText('ab', fieldName: 'Kode', minLength: 3);
        expect(result, equals('Kode harus antara 3-100 karakter'));
      });

      test('mengembalikan null (valid) jika panjang teks sesuai', () {
        final result = Validators.validateText('Habib', fieldName: 'Nama', minLength: 2, maxLength: 10);
        expect(result, isNull);
      });
    });
  });
}