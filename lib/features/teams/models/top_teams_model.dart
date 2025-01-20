class TopTeamsModel {
  List<Year>? l2025;

  TopTeamsModel({this.l2025});

  TopTeamsModel.fromJson(Map<String, dynamic> json) {
    if (json['2025'] != null) {
      l2025 = <Year>[];
      json['2025'].forEach((v) {
        l2025!.add(Year.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (l2025 != null) {
      data['2025'] = l2025!.map((v) => v.toJson()).toList();
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
