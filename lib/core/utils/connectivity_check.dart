import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../config/constants/api_endpoints.dart';
import '../network/api/api.dart';
import '../network/hive/hive_queries.dart';

class ConnectivityCheck {
  /// The function checks the connectivity status of the device and returns true if it is connected via
  /// mobile data or Wi-Fi, and false if there is no connectivity.
  /// 
  /// Returns:
  ///   a Future<bool> value.
  static Future<bool> connectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }

  /// The function `isServerup` checks if the server is up by making an API request and returns a
  /// boolean value indicating the server status.
  /// 
  /// Args:
  ///   recheck (bool): The `recheck` parameter is a boolean value that determines whether to recheck
  /// the server status or not. If `recheck` is set to `true`, the function will send a request to the
  /// server to check its status. If `recheck` is set to `false`, the function. Defaults to false
  /// 
  /// Returns:
  ///   a `Future<bool>`.
  static Future<bool> isServerup({bool recheck = false}) async {
    try {
      if (recheck) {
        final api = GetIt.instance.get<Api>();
        final response = await api.sendRequest.get(
          ApiEndpoints.baseRoute,
        );
        ApiResponse responseApi = ApiResponse.fromResponse(response);
        if (responseApi.success) {
          await GetIt.instance<HiveQueries>().setValue(
            boxName: 'users',
            key: 'server',
            value: true,
          );
          return true;
        } else {
          return false;
        }
      } else {
        return await GetIt.instance<HiveQueries>()
            .getValue(boxName: 'users', key: 'server', defaultValue: false);
      }
    } catch (e) {
      return false;
    }
  }
}
