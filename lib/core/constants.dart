// App-wide colors
import 'package:flutter/material.dart';

const Color primary = Color(0xFFC39E18);
const Color gray900 = Color(0xFF3E3E3E);
const Color gray700 = Color(0xFF626262);
const Color gray500 = Color(0xFF8E8E8E);
const Color gray300 = Color(0xFFBEBEBE);
const Color gray100 = Color(0xFFE9E9E9);
const Color background = Color(0xFFF1F2F6);
const Color black = Colors.black;
const Color white = Colors.white;

const Map<String, String> authExceptionMapper = {
  'email-already-in-use':
      'This email is already taken. Try with a new email or sign in with the provided email!',
  'invalid-email': 'The provided email address is not valid!',
  'weak-password': 'Your password is too weak. Try with a strong password!',
  'user-disabled': 'Account with this email address is disabled!',
  'user-not-found': 'No account with this email address!',
  'wrong-password': 'The provided password is not correct!',
  'INVALID_LOGIN_CREDENTIALS': 'The provided email or password is not correct!',
  'too-many-requests': 'Too many requests. Try again later!',
  'network-request-failed':
      'Couldn\'t move forward. Check your internet connection!',
  'user-mismatch': 'Prvided credentials do not match!',
  'invalid-credential': 'Your provider\'s credentials are not valid!',
};
