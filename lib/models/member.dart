class Member {
  String displayName;
  bool active;

  Member({required this.displayName, this.active = true});

  Member.fromJson(Map<String, Object?> json)
      : this(
          displayName: json['displayName']! as String,
          active: json['active'] as bool,
        );

  Member copyWith({
    String? displayName,
    bool? active,
  }) {
    return Member(
      displayName: displayName ?? this.displayName,
      active: active ?? this.active,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'displayName': displayName,
      'active': active,
    };
  }
}
