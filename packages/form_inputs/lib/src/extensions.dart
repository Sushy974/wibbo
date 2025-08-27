import 'package:formz/formz.dart';

extension FormzInputX on FormzInput<dynamic, dynamic> {
  bool get isNotPure => !isPure;

  bool get isNotPureEtNotValid => !isPure && isNotValid;
}

extension FormzSubmissionStatusX on FormzSubmissionStatus {
  bool get isNotInProgress => !isInProgress;

  bool get isNotInProgressOrSuccess => !isInProgressOrSuccess;
}
