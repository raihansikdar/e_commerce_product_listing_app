// internet_state.dart
import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InternetConnectedState extends InternetState {}

class InternetDisconnectedState extends InternetState {}
