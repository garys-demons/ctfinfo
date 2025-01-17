class EventDetailModel {
  List<Organizers>? organizers;
  String? ctftimeUrl;
  int? ctfId;
  num? weight;
  Duration? duration;
  String? liveFeed;
  String? logo;
  int? id;
  String? title;
  String? start;
  int? participants;
  String? location;
  String? finish;
  String? description;
  String? format;
  bool? isVotableNow;
  String? prizes;
  int? formatId;
  bool? onsite;
  String? restrictions;
  String? url;
  bool? publicVotable;

  EventDetailModel(
      {this.organizers,
      this.ctftimeUrl,
      this.ctfId,
      this.weight,
      this.duration,
      this.liveFeed,
      this.logo,
      this.id,
      this.title,
      this.start,
      this.participants,
      this.location,
      this.finish,
      this.description,
      this.format,
      this.isVotableNow,
      this.prizes,
      this.formatId,
      this.onsite,
      this.restrictions,
      this.url,
      this.publicVotable});

  EventDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['organizers'] != null) {
      organizers = <Organizers>[];
      json['organizers'].forEach((v) {
        organizers!.add(Organizers.fromJson(v));
      });
    }
    ctftimeUrl = json['ctftime_url']; 
    ctfId = json['ctf_id'];
    weight = json['weight'];
    duration =
        json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    liveFeed = json['live_feed'];
    logo = json['logo'];
    id = json['id'];
    title = json['title'];
    start = json['start'];
    participants = json['participants'];
    location = json['location'];
    finish = json['finish'];
    description = json['description'];
    format = json['format'];
    isVotableNow = json['is_votable_now'];
    prizes = json['prizes'];
    formatId = json['format_id'];
    onsite = json['onsite'];
    restrictions = json['restrictions'];
    url = json['url'];
    publicVotable = json['public_votable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (organizers != null) {
      data['organizers'] = organizers!.map((v) => v.toJson()).toList();
    }
    data['ctftime_url'] = ctftimeUrl;
    data['ctf_id'] = ctfId;
    data['weight'] = weight;
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    data['live_feed'] = liveFeed;
    data['logo'] = logo;
    data['id'] = id;
    data['title'] = title;
    data['start'] = start;
    data['participants'] = participants;
    data['location'] = location;
    data['finish'] = finish;
    data['description'] = description;
    data['format'] = format;
    data['is_votable_now'] = isVotableNow;
    data['prizes'] = prizes;
    data['format_id'] = formatId;
    data['onsite'] = onsite;
    data['restrictions'] = restrictions;
    data['url'] = url;
    data['public_votable'] = publicVotable;
    return data;
  }
}

class Organizers {
  int? id;
  String? name;

  Organizers({this.id, this.name});

  Organizers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Duration {
  int? hours;
  int? days;

  Duration({this.hours, this.days});

  Duration.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hours'] = hours;
    data['days'] = days;
    return data;
  }
}
