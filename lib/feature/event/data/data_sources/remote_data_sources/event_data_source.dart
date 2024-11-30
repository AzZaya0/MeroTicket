import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:template/config/constants/api_endpoints.dart';
import 'package:template/config/constants/pref_key.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/core/network/api/api.dart';
import 'package:template/core/preferences/preferences.dart';
import 'package:template/core/utils/create_form_data.dart';
import 'package:template/feature/event/data/models/create_event_model.dart';
import 'package:template/feature/event/data/models/my_events_model.dart';
import 'package:template/feature/event/data/models/search_vendor_model.dart';
import 'package:template/feature/event/data/repository/event_repo.dart';
import 'package:template/feature/event/presentation/pages/my_events.dart';

class EventDataSource extends EventRepo {
  final Api api;
  final Preferences preferences;
  EventDataSource({
    required this.api,
    required this.preferences,
  });

  @override
  Future<Either<CreateEventModel?, AppErrorHandler>> createEvent(
      {required File imageFile,
      required String title,
      required String description,
      required String address,
      required String startTime,
      required String endTime,
      required String startDate,
      required String endDate,
      required List<int?> eventVenderId}) async {
    try {
      var token = await preferences.getString(PrefKey.token);
      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token ?? ''}"
      };

      var data = await createFormData('event_image', imageFile, {
        'title': title,
        'description': description,
        'start_date': startDate,
        'end_date': endDate,
        'start_time': startTime,
        'end_time': endTime,
        'address': address,
        'event_vender_id[]': eventVenderId,
      });

      final response = await api.sendRequest.post(
        options: Options(headers: headers),
        PostApiEndPoints.event,
        data: data,
      );
      if (response.statusCode == 200) {
        var model = CreateEventModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }

      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }

  @override
  Future<Either<SearchVendorModel?, AppErrorHandler>> searchVendor(
      {required String query}) async {
    try {
      var token = await preferences.getString(PrefKey.token);
      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token ?? ''}"
      };

      final response = await api.sendRequest.get(
        options: Options(headers: headers),
        GetApiEndPoints.searchVendor,
        queryParameters: {"search_keyword": query},
      );
      if (response.statusCode == 200) {
        var model = SearchVendorModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }

      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }

  @override
  Future<Either<MyEventsModel?, AppErrorHandler>> getMyEvents() async {
    try {
      var token = await preferences.getString(PrefKey.token);
      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token ?? ''}"
      };

      final response = await api.sendRequest.get(
        options: Options(headers: headers),
        GetApiEndPoints.myEvents,
      );
      if (response.statusCode == 200) {
        var model = MyEventsModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }

      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }
}
