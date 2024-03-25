import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LibraryList {
  List<Library> library;
  LibraryList({
    required this.library,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'library': library.map((x) => x.toMap()).toList(),
    };
  }

  factory LibraryList.fromMap(Map<String, dynamic> map) {
    return LibraryList(
      library: List<Library>.from((map['library'] as List<dynamic>).map<Library>((x) => Library.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory LibraryList.fromJson(String source) => LibraryList.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Library {
  String? id;
  String? logo;
  String? appName;
  String? packageName;
  num? rating;
  String? type;
  String? shortDescription;
  num? totalDownloads;
  String? version;
  Library({
    this.id,
    this.logo,
    this.appName,
    this.packageName,
    this.rating,
    this.type,
    this.shortDescription,
    this.totalDownloads,
    this.version,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo': logo,
      'appName': appName,
      'packageName': packageName,
      'rating': rating,
      'type': type,
      'shortDescription': shortDescription,
      'totalDownloads': totalDownloads,
      'version': version,
    };
  }

  factory Library.fromMap(Map<String, dynamic> map) {
    return Library(
      id: map['id'] != null ? map['id'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      appName: map['appName'] != null ? map['appName'] as String : null,
      packageName: map['packageName'] != null ? map['packageName'] as String : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      type: map['type'] != null ? map['type'] as String : null,
      shortDescription: map['shortDescription'] != null ? map['shortDescription'] as String : null,
      totalDownloads: map['totalDownloads'] != null ? map['totalDownloads'] as num : null,
      version: map['version'] != null ? map['version'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Library.fromJson(String source) => Library.fromMap(json.decode(source) as Map<String, dynamic>);
}
