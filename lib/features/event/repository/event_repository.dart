import 'package:ctfinfo/api/rest_client.dart';

class EventRepository extends RestClient {
  Future<dynamic> getAllEvents() async {
    var unixTimeMilliseconds =
        (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000).toString();
    return await get('events/?limit=30&start=$unixTimeMilliseconds');
  }
}
