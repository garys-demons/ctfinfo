import 'package:ctfinfo/api/rest_client.dart';

class EventRepository extends RestClient {
  Future<dynamic> getAllEvents() async {
    var unixTimeMilliseconds =
        (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000).toString();
    return await get('events/?limit=50&start=$unixTimeMilliseconds');
  }

  Future<dynamic> getEventDetail(String eventId) async {
    return await get('events/$eventId/');
  }
}
