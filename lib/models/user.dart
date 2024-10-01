class User {
  String displayName;

  User({required this.displayName});

  User.fromJson(Map<String, Object?> json)
      : this(
          displayName: json['displayName']! as String,
        );

  User copyWith({
    String? displayName,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'displayName': displayName,
    };
  }
}
