import 'dart:convert';

class Identity {
  String name;
  String email;
  Identity({
    required this.name,
    required this.email,
  });

  Identity copyWith({
    String? name,
    String? email,
  }) {
    return Identity(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory Identity.fromMap(Map<String, dynamic> map) {
    return Identity(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Identity.fromJson(String source) =>
      Identity.fromMap(json.decode(source));

  @override
  String toString() => 'Identity(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Identity && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
