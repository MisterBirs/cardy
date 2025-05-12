import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  final String _message;

  const AuthException(this._message);

  const AuthException.emailAlreadyInUse()
      : _message = 'כתובת האימייל כבר בשימוש.';
  const AuthException.invalidEmail() : _message = 'כתובת האימייל אינה תקינה.';
  const AuthException.weakPassword()
      : _message = 'הסיסמה חלשה מדי. בחר סיסמה חזקה יותר.';
  const AuthException.operationNotAllowed()
      : _message = 'הרשמה באמצעות אימייל אינה זמינה כרגע.';
  const AuthException.generalAuthError()
      : _message = 'שגיאת הרשמה. נסה שוב מאוחר יותר.';
  const AuthException.unexpected()
      : _message = 'שגיאה לא צפויה. נסה שוב מאוחר יותר.';
  @override
  String toString() => _message;
}
