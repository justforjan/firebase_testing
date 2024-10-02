import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String name;
  double total;
  Timestamp? createdOn;
  List<String>? members;

  Group(
      {required this.name, required this.total, this.createdOn, this.members});

  Group.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          total: json['total']! as double,
          createdOn: json['createdOn']! as Timestamp,
          members: (json['members'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

  Group copyWith(
      {String? name,
      double? total,
      Timestamp? createdOn,
      List<String>? members}) {
    return Group(
        name: name ?? this.name,
        total: total ?? this.total,
        createdOn: createdOn ?? this.createdOn,
        members: members ?? this.members);
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'total': total,
      'createdOn': createdOn,
      'members': members
    };
  }
}
