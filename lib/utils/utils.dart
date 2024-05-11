import 'dart:convert';
import 'package:crypto/crypto.dart';

String hash(String input) {
  var bytes = utf8.encode(input);
  var hash = sha512.convert(bytes);
  return hash.toString();
}

String getPassword(String masterPassword, String username, String siteDomain) {
  return hash(masterPassword + username + siteDomain);
}
