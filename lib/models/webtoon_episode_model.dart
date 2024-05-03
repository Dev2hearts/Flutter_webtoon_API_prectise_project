class WebtoonEpisodeModel {
  final String id, title, rating, date, thumb;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : thumb = json["thumb"],
        id = json["id"],
        title = json["title"],
        rating = json["rating"],
        date = json["date"];
}
