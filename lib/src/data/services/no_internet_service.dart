import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class NoInternetService {
  static final NoInternetService _internetService = NoInternetService.private();
  factory NoInternetService() => _internetService;
  NoInternetService.private();

  final Connectivity _connectivity = Connectivity();
  static final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  static Stream<bool> get streamconection =>
      NoInternetService._streamController.stream;
  bool _isconnected = true;
  Future<void> intialize() async {
    _checkconnectivity();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> a) {
      _checkinternet(a);
    });
  }

  Future<void> _checkconnectivity() async {
    final res = await _connectivity.checkConnectivity();
    _checkinternet(res);
  }

  Future<void> _checkinternet(List<ConnectivityResult> response) async {
    bool hasconnected = false;
    if (response.contains(ConnectivityResult.none)) {
      hasconnected = false;
    } else {
      try {
        final result = await http
            .get(Uri.parse('https://www.google.com'))
            .timeout(const Duration(seconds: 5));
        hasconnected = result.statusCode == 200;
      } catch (_) {
        hasconnected = false;
      }
    }
    if (_isconnected != hasconnected) {
      _isconnected = hasconnected;
      _streamController.add(hasconnected);
    }
  }

  Future<bool> refreshinternet() async {
    try {
      final a = await http.get(Uri.parse("https://www.google.com"));
      return a.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _streamController.close();
  }
}
