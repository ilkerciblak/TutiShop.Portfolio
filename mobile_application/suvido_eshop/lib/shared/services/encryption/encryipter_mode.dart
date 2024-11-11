import 'package:encrypt/encrypt.dart';

enum EncryipterMode {
  fernet,
  aes,
  salsa20,
}

extension EncripterModeX on EncryipterMode {
  IV? get getIv {
    switch (this) {
      case EncryipterMode.aes:
        return IV.fromLength(16);
      case EncryipterMode.salsa20:
        return IV.fromLength(8);
      case EncryipterMode.fernet:
        return null;
      default:
        return null;
    }
  }
}
