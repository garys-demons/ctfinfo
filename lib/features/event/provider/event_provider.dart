import 'package:ctfinfo/features/event/models/event_detail_model.dart';
import 'package:ctfinfo/features/event/models/event_model.dart';
import 'package:ctfinfo/features/event/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  final _repository = EventRepository();

  final List<EventModel> _events = [];
  EventDetailModel _eventDetail = EventDetailModel();
  List<EventModel> get events => _events;
  EventDetailModel get eventDetail => _eventDetail;

  Future<bool> getAllEvents() async {
    try {
      final response = await _repository.getAllEvents();
      _events.clear();
      for (var event in response) {
        _events.add(EventModel.fromJson(event));
      }
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Error in getting events: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getEventDetail(String eventId) async {
    try {
      final response = await _repository.getEventDetail(eventId);
      _eventDetail = EventDetailModel.fromJson(response);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Error in getting event detail: $e");
      notifyListeners();
      return false;
    }
  }
}
