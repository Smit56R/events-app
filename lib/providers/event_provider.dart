import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/event.dart';

class EventProvider {
  static Future<List<Event>> fetchEvents() async {
    final url = Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event');

    try {
      List<Event> events = [];
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var event in (extractedData['content']['data'] as List<dynamic>)) {
        events.add(Event.fromJson(event));
      }
      return events;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Event>> searchEvents(String search) async {
    final url = Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$search');

    try {
      List<Event> events = [];
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var event in (extractedData['content']['data'] as List<dynamic>)) {
        events.add(Event.fromJson(event));
      }
      return events;
    } catch (e) {
      rethrow;
    }
  }
}
