class Yonetmenler {
  String yonetmen_id;
  String yonetmen_ad;
  Yonetmenler({
    required this.yonetmen_id,
    required this.yonetmen_ad,
  });

  factory Yonetmenler.fromJson(Map<String, dynamic> json) {
    return Yonetmenler(
        yonetmen_id: json["yonetmen_id"], yonetmen_ad: json["yonetmen_ad"]);
  }
}
