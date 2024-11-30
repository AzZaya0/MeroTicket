import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/feature/event/data/models/create_event_model.dart';
import 'package:template/feature/event/data/models/get_event_by_id.dart';
import 'package:template/feature/event/data/models/my_events_model.dart';
import 'package:template/feature/event/data/models/search_vendor_model.dart';

import '../models/all_events_model.dart';

abstract class EventRepo {
  Future<Either<CreateEventModel?, AppErrorHandler>> createEvent({
    required File imageFile,
    required String title,
    required String description,
    required String address,
    required String startTime,
    required String endTime,
    required String category,
    required String startDate,
    required String endDate,
    required List<int?> eventVenderId,
  });

  Future<Either<SearchVendorModel?, AppErrorHandler>> searchVendor(
      {required String query});
  Future<Either<MyEventsModel?, AppErrorHandler>> getMyEvents();
  Future<Either<AllEventsModel?, AppErrorHandler>> getAllEvents();
  Future<Either<GetEventById?, AppErrorHandler>> getEventById({int? eventId});
}
