class Member {
  String displayName;

  Member({required this.displayName});

  Member.fromJson(Map<String, Object?> json)
      : this(
          displayName: json['displayName']! as String,
        );

  Member copyWith({
    String? displayName,
  }) {
    return Member(
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'displayName': displayName,
    };
  }
}
