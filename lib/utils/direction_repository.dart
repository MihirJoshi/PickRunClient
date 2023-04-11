import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const googleAPIKey = 'AIzaSyDvHoHg-RMbsw8ThbjNG5bsEzr4t419prs';

class DistanceRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/distancematrix/json?';

  final Dio _dio;

  DistanceRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<int?> getDistance({
    required String origin,
    required String destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origins': origin,
        'destinations': destination,
        'key': googleAPIKey,
      },
    );

    if (response.statusCode == 200) {
      final rows = response.data['rows'] as List<dynamic>;
      if (rows.isNotEmpty) {
        final elements = rows.first['elements'] as List<dynamic>;
        if (elements.isNotEmpty) {
          final distance = elements.first['distance'] as Map<String, dynamic>;
          return distance['value'] as int?;
        }
      }
    }
    return null;
  }
}