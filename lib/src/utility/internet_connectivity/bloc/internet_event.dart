// internet_event.dart
import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InternetConnectedEvent extends InternetEvent {}

class InternetDisconnectedEvent extends InternetEvent {}
