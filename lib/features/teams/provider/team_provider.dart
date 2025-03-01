import 'package:ctfinfo/features/teams/models/team_detail_model.dart';
import 'package:ctfinfo/features/teams/models/top_teams_model.dart';
import 'package:ctfinfo/features/teams/repository/team_repository.dart';
import 'package:flutter/material.dart';

class TeamProvider extends ChangeNotifier {
  final TeamRepository _repository = TeamRepository();
  TopTeamsModel _topTeams = TopTeamsModel();
  TopTeamsModel get topTeams => _topTeams;

  TeamDetailModel _teamDetail = TeamDetailModel();
  TeamDetailModel get teamDetail => _teamDetail;

  dynamic _data2024;
  dynamic get data2024 => _data2024;

  set data2024(dynamic value) {
    _data2024 = value;
    notifyListeners();
  }

  Future<bool> getAllTeams() async {
    try {
      final response = await _repository.getAllTeams();
      _topTeams = TopTeamsModel.fromJson(response);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Error in getting teams: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getTeamDetail(String teamId) async {
    try {
      final response = await _repository.getTeamDetail(teamId);
      _teamDetail = TeamDetailModel.fromJson(response);
      data2024 = response["rating"]["2024"];
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Error in getting team detail: $e");
      notifyListeners();
      return false;
    }
  }
}
