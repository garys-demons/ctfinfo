import 'package:ctfinfo/features/teams/models/top_teams_model.dart';
import 'package:ctfinfo/features/teams/repository/team_repository.dart';
import 'package:flutter/material.dart';

class TeamProvider extends ChangeNotifier {
  final TeamRepository _repository = TeamRepository();
  TopTeamsModel _topTeams = TopTeamsModel();
  TopTeamsModel get topTeams => _topTeams;

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
}
