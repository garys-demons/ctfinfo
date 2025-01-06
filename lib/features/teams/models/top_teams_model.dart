class TopTeamsModel {
  List<Year>? l2024;

  TopTeamsModel({this.l2024});

  TopTeamsModel.fromJson(Map<String, dynamic> json) {
    if (json['2024'] != null) {
      l2024 = <Year>[];
      json['2024'].forEach((v) {
        l2024!.add(Year.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (l2024 != null) {
      data['2024'] = l2024!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Year {
  String? teamName;
  double? points;
  int? teamId;

  Year({this.teamName, this.points, this.teamId});

  Year.fromJson(Map<String, dynamic> json) {
    teamName = json['team_name'];
    points = json['points'];
    teamId = json['team_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_name'] = teamName;
    data['points'] = points;
    data['team_id'] = teamId;
    return data;
  }
}
