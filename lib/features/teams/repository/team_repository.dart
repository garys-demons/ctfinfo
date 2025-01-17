import 'package:ctfinfo/api/rest_client.dart';

class TeamRepository extends RestClient {
  Future<dynamic> getAllTeams() async {
    return await get('top/');
  }

  Future<dynamic> getTeamDetail(String teamId) async {
    return await get(
      'teams/$teamId/');
  }
}
