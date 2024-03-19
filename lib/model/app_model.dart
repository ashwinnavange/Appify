// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppList {
  List<App>? apps;
  AppList({
    this.apps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apps': apps!.map((x) => x.toMap()).toList(),
    };
  }

  factory AppList.fromMap(Map<String, dynamic> map) {
    return AppList(
      apps: map['apps'] != null ? List<App>.from((map['apps'] as List<dynamic>).map<App?>((x) => App.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppList.fromJson(String source) => AppList.fromMap(json.decode(source) as Map<String, dynamic>);
}

class App {
  String? id;
  String? logo;
  String? appName;
  String? userId;
  String? packageName;
  String? appFile;
  num? rating;
  String? developerName;
  String? type;
  String? shortDescription;
  String? description;
  String? whatsNew;
  List<String>? categories;
  List<String>? photos;
  num? totalDownloads;
  String? createdAt;
  String? version;
  App({
    this.id,
    this.logo,
    this.appName,
    this.userId,
    this.packageName,
    this.appFile,
    this.rating,
    this.developerName,
    this.type,
    this.shortDescription,
    this.description,
    this.whatsNew,
    this.categories,
    this.photos,
    this.totalDownloads,
    this.createdAt,
    this.version,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'logo': logo,
      'appName': appName,
      'userId': userId,
      'packageName': packageName,
      'appFile': appFile,
      'rating': rating,
      'developerName': developerName,
      'type': type,
      'shortDescription': shortDescription,
      'description': description,
      'whatsNew': whatsNew,
      'categories': categories,
      'photos': photos,
      'totalDownloads': totalDownloads,
      'createdAt': createdAt,
      'version': version,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      id: map['_id'] != null ? map['_id'] as String : '',
      logo: map['logo'] != null ? map['logo'] as String : '',
      appName: map['appName'] != null ? map['appName'] as String : '',
      userId: map['userId'] != null ? map['userId'] as String : '',
      packageName: map['packageName'] != null ? map['packageName'] as String : '',
      appFile: map['appFile'] != null ? map['appFile'] as String : '',
      rating: map['rating'] != null ? map['rating'] as num : 0,
      developerName: map['developerName'] != null ? map['developerName'] as String : '',
      type: map['type'] != null ? map['type'] as String : '',
      shortDescription: map['shortDescription'] != null ? map['shortDescription'] as String : '',
      description: map['description'] != null ? map['description'] as String : '',
      whatsNew: map['whatsNew'] != null ? map['whatsNew'] as String : '',
      categories: map['categories'] != null ? List<String>.from((map['categories'] as List<dynamic>)) : [],
      photos: map['photos'] != null ? List<String>.from((map['photos'] as List<dynamic>)) : [],
      totalDownloads: map['totalDownloads'] != null ? map['totalDownloads'] as num : 0,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : '',
      version: map['version'] != null ? map['version'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory App.fromJson(String source) => App.fromMap(json.decode(source) as Map<String, dynamic>);
}
