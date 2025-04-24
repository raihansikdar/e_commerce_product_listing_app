// internet_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity;
  late StreamSubscription _subscription;

  InternetBloc(this._connectivity) : super(InternetConnectedState()) {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        add(InternetDisconnectedEvent());
      } else {
        add(InternetConnectedEvent());
      }
    });

    on<InternetConnectedEvent>((event, emit) {
      emit(InternetConnectedState());
    });

    on<InternetDisconnectedEvent>((event, emit) {
      emit(InternetDisconnectedState());
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
