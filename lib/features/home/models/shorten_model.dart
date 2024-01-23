class ShortenModel {
  final String id;
  final String? slashtag;
  final String? destination;
  final DateTime? createdAt;
  final String? shortUrl;
  final String? domainId;
  final String? domainName;
  final DomainModel? domain;
  final CreatorModel? creator;

  ShortenModel({
    required this.id,
    required this.slashtag,
    required this.destination,
    required this.createdAt,
    required this.shortUrl,
    required this.domainId,
    required this.domainName,
    required this.domain,
    required this.creator,
  });

  factory ShortenModel.fromJson(Map<String, dynamic> json) => ShortenModel(
      id: json["id"],
      slashtag: json["slashtag"],
      destination: json["destination"],
      createdAt: DateTime.parse(json["createdAt"]),
      shortUrl: json["shortUrl"],
      domainId: json["domainId"],
      domainName: json["domainName"],
      domain: DomainModel.fromJson(json["domain"]),
      creator: CreatorModel.fromJson(json["creator"]));
}

class DomainModel {
  final String id;
  final String? ref;
  final String? fullName;
  final bool active;

  DomainModel({
    required this.id,
    required this.ref,
    required this.fullName,
    required this.active,
  });

  factory DomainModel.fromJson(Map<String, dynamic> json) => DomainModel(
        id: json["id"],
        ref: json["ref"],
        fullName: json["fullName"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ref": ref,
        "fullName": fullName,
        "active": active,
      };
}

class CreatorModel {
  final String id;
  final String? fullName;
  final String? avatarUrl;

  CreatorModel({
    required this.id,
    required this.fullName,
    required this.avatarUrl,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) => CreatorModel(
        id: json["id"],
        fullName: json["fullName"],
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "avatarUrl": avatarUrl,
      };
}
