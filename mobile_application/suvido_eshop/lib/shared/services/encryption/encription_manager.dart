import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:suvido_eshop/shared/services/encryption/encryipter_mode.dart';

class EncriptionManager {
  final String secureKey;
  final EncryipterMode encryipterMode;
  late final IV? iv;

  EncriptionManager({
    required this.secureKey,
    required this.encryipterMode,
  }) : iv = encryipterMode.getIv;

  Encrypter get encrypter {
    switch (encryipterMode) {
      case EncryipterMode.fernet:
        return configureFernetEncrpyter();
      case EncryipterMode.aes:
        throw UnimplementedError(
            'AES typed encryption is not implemented at $runtimeType');
      case EncryipterMode.salsa20:
        return configureSalsa20Encrypter();
      default:
        return configureFernetEncrpyter();
    }
  }

  Encrypter configureFernetEncrpyter() {
    final key = Key.fromUtf8(secureKey);
    final b64Key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));

    return Encrypter(Fernet(b64Key));
  }

  Encrypter configureSalsa20Encrypter() {
    final key = Key.fromUtf8(secureKey);
    final b64Key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));

    return Encrypter(Salsa20(b64Key));
  }

  String encypt(String plainText) {
    final encrytedText = encrypter.encrypt(plainText, iv: iv);
    return encrytedText.base64;
  }

  String decrypt(String encryptedText) {
    final decryptedText = encrypter.decrypt64(encryptedText, iv: iv);
    return decryptedText;
  }
}
