class TeamDetailModel {
  TeamDetailModel({
    this.name,
    this.rating,
    this.logo,
    this.country,
    this.id,
  });

  String? name;
  Map<String, Rating>? rating;
  String? logo;
  String? country;
  int? id;

  TeamDetailModel.fromJson(Map<String, dynamic> json) {
    rating = Map.from(json["rating"])
        .map((k, v) => MapEntry<String, Rating>(k, Rating.fromJson(v)));
    name = json["name"];
    logo = json["logo"];
    country = json["country"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    if (rating != null) {
      data['rating'] = Map.from(rating!)
          .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson()));
    }
    data["logo"] = logo;
    data["country"] = country;
    data["id"] = id;
    return data;
  }
}

class Rating {
  Rating({
    this.organizerPoints,
    this.ratingPoints,
    this.ratingPlace,
    this.countryPlace,
  });

  num? organizerPoints;
  num? ratingPoints;
  num? ratingPlace;
  num? countryPlace;

  Rating.fromJson(Map<String, dynamic> json) {
    organizerPoints = json['organizerPoints'];
    ratingPlace = json['ratingPlace'];
    ratingPoints = json['ratingPoints'];
    countryPlace = json['countryPlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["organizerPoints"] = organizerPoints;
    data["ratingPoints"] = ratingPoints;
    data["ratingPlace"] = ratingPlace;
    data["countryPlace"] = countryPlace;
    return data;
  }
}
