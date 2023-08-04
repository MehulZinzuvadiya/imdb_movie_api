// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  int? page;
  String? next;
  int? entries;
  List<Result>? results;

  MovieModel({
    this.page,
    this.next,
    this.entries,
    this.results,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        next: json["next"],
        entries: json["entries"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "next": next,
        "entries": entries,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? id;
  String? resultId;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  TitleText? titleText;
  TitleText? originalTitleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;

  Result({
    this.id,
    this.resultId,
    this.primaryImage,
    this.titleType,
    this.titleText,
    this.originalTitleText,
    this.releaseYear,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        resultId: json["id"],
        primaryImage: json["primaryImage"] == null
            ? null
            : PrimaryImage.fromJson(json["primaryImage"]),
        titleType: json["titleType"] == null
            ? null
            : TitleType.fromJson(json["titleType"]),
        titleText: json["titleText"] == null
            ? null
            : TitleText.fromJson(json["titleText"]),
        originalTitleText: json["originalTitleText"] == null
            ? null
            : TitleText.fromJson(json["originalTitleText"]),
        releaseYear: json["releaseYear"] == null
            ? null
            : ReleaseYear.fromJson(json["releaseYear"]),
        releaseDate: json["releaseDate"] == null
            ? null
            : ReleaseDate.fromJson(json["releaseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": resultId,
        "primaryImage": primaryImage?.toJson(),
        "titleType": titleType?.toJson(),
        "titleText": titleText?.toJson(),
        "originalTitleText": originalTitleText?.toJson(),
        "releaseYear": releaseYear?.toJson(),
        "releaseDate": releaseDate?.toJson(),
      };
}

class TitleText {
  String? text;
  OriginalTitleTextTypename? typename;

  TitleText({
    this.text,
    this.typename,
  });

  factory TitleText.fromJson(Map<String, dynamic> json) => TitleText(
        text: json["text"],
        typename: originalTitleTextTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "__typename": originalTitleTextTypenameValues.reverse[typename],
      };
}

enum OriginalTitleTextTypename { TITLE_TEXT }

final originalTitleTextTypenameValues =
    EnumValues({"TitleText": OriginalTitleTextTypename.TITLE_TEXT});

class PrimaryImage {
  String? id;
  int? width;
  int? height;
  String? url;
  Caption? caption;
  String? typename;

  PrimaryImage({
    this.id,
    this.width,
    this.height,
    this.url,
    this.caption,
    this.typename,
  });

  factory PrimaryImage.fromJson(Map<String, dynamic> json) => PrimaryImage(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        caption:
            json["caption"] == null ? null : Caption.fromJson(json["caption"]),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "caption": caption?.toJson(),
        "__typename": typename,
      };
}

class Caption {
  String? plainText;
  String? typename;

  Caption({
    this.plainText,
    this.typename,
  });

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        plainText: json["plainText"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
        "__typename": typename,
      };
}

class ReleaseDate {
  int? day;
  int? month;
  int? year;
  String? typename;

  ReleaseDate({
    this.day,
    this.month,
    this.year,
    this.typename,
  });

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
        "__typename": typename,
      };
}

class ReleaseYear {
  int? year;
  int? endYear;
  ReleaseYearTypename? typename;

  ReleaseYear({
    this.year,
    this.endYear,
    this.typename,
  });

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => ReleaseYear(
        year: json["year"],
        endYear: json["endYear"],
        typename: releaseYearTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "endYear": endYear,
        "__typename": releaseYearTypenameValues.reverse[typename],
      };
}

enum ReleaseYearTypename { YEAR_RANGE }

final releaseYearTypenameValues =
    EnumValues({"YearRange": ReleaseYearTypename.YEAR_RANGE});

class TitleType {
  Text? text;
  Id? id;
  bool? isSeries;
  bool? isEpisode;
  TitleTypeTypename? typename;

  TitleType({
    this.text,
    this.id,
    this.isSeries,
    this.isEpisode,
    this.typename,
  });

  factory TitleType.fromJson(Map<String, dynamic> json) => TitleType(
        text: textValues.map[json["text"]]!,
        id: idValues.map[json["id"]]!,
        isSeries: json["isSeries"],
        isEpisode: json["isEpisode"],
        typename: titleTypeTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "id": idValues.reverse[id],
        "isSeries": isSeries,
        "isEpisode": isEpisode,
        "__typename": titleTypeTypenameValues.reverse[typename],
      };
}

enum Id { MOVIE, TV_MOVIE, TV_SERIES }

final idValues = EnumValues(
    {"movie": Id.MOVIE, "tvMovie": Id.TV_MOVIE, "tvSeries": Id.TV_SERIES});

enum Text { MOVIE, TV_MOVIE, TV_SERIES }

final textValues = EnumValues({
  "Movie": Text.MOVIE,
  "TV Movie": Text.TV_MOVIE,
  "TV Series": Text.TV_SERIES
});

enum TitleTypeTypename { TITLE_TYPE }

final titleTypeTypenameValues =
    EnumValues({"TitleType": TitleTypeTypename.TITLE_TYPE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
