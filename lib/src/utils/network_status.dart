import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> networkStatus() async {
  final result = await (Connectivity().checkConnectivity());
  return (result.contains(ConnectivityResult.mobile)) ||
      (result.contains(ConnectivityResult.wifi));
}
