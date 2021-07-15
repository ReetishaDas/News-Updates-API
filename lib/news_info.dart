// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.statusCode,
    this.version,
    this.lastModified,
    this.access,
    this.total,
    this.limit,
    this.offset,
    this.data,
  });

  String status;
  int statusCode;
  String version;
  String lastModified;
  String access;
  int total;
  int limit;
  int offset;
  List<Datum> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        statusCode: json["status-code"],
        version: json["version"],
        lastModified: json["last-modified"],
        access: json["access"],
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status-code": statusCode,
        "version": version,
        "last-modified": lastModified,
        "access": access,
        "total": total,
        "limit": limit,
        "offset": offset,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.link,
    this.published,
    this.summary,
    this.image,
  });

  int id;
  String title;
  String link;
  String published;
  String summary;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        published: json["published"],
        summary: json["summary"] == null ? null : json["summary"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "published": published,
        "summary": summary == null ? null : summary,
        "image": image == null ? null : image,
      };
}
