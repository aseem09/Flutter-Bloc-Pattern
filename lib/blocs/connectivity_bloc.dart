import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'bloc.dart';

class ConnectivityBloc implements Bloc {
  final _connectivity = new Connectivity();
  final _connectivityController = new StreamController<ConnectivityResult>();

  Stream<ConnectivityResult> get connectivityResultStream {
    return _connectivityController.stream;
  }

  checkNetworkStatus() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    _connectivityController.sink.add(connectivityResult);
  }

  dispose() {
    _connectivityController.close();
  }
}
