// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

const firestoreSerializable = JsonSerializable(
  explicitToJson: true,
  converters: firestoreJsonConverters,
  createFieldMap: true,
  createFactory: true,
  createPerFieldToJson: true,
);
