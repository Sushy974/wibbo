import 'package:dart_firebase_admin/firestore.dart';

extension FirestoreTimestampConversion on DateTime {
  static DateTime fromTimestampFirestore(Timestamp data) {
    final seconds = data.seconds;
    final nanoseconds = data.nanoseconds;
    final microseconds = seconds * 1000000 + nanoseconds ~/ 1000;
    return DateTime.fromMicrosecondsSinceEpoch(microseconds, isUtc: true)
        .toLocal();
  }
}
