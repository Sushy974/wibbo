import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/middlewares.dart';

Handler middleware(Handler handler) {
  return handler.use(firestore());
}
