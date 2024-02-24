class Cries {
    String latest;
    String legacy;

    Cries({
        required this.latest,
        required this.legacy,
    });

    factory Cries.fromJson(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
    );

    Map<String, dynamic> toJson() => {
        "latest": latest,
        "legacy": legacy,
    };
}
