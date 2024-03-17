import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModels {
  final String email;
  final String name;
  final String profilePic;
  final String bannerPic;
  final String uid;
  final String bio;
  final bool isTwitterblue;
  final List<String> followers;
  final List<String> followings;
  UserModels({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.bannerPic,
    required this.uid,
    required this.bio,
    required this.isTwitterblue,
    required this.followers,
    required this.followings,
  });

  UserModels copyWith({
    String? email,
    String? name,
    String? profilePic,
    String? bannerPic,
    String? uid,
    String? bio,
    bool? isTwitterblue,
    List<String>? followers,
    List<String>? followings,
  }) {
    return UserModels(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterblue: isTwitterblue ?? this.isTwitterblue,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'bannerPic': bannerPic,
      'bio': bio,
      'isTwitterblue': isTwitterblue,
      'followers': followers,
      'followings': followings,
    };
  }

  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      bannerPic: map['bannerPic'] ?? '',
      uid: map['\$id'] ?? '',
      bio: map['bio'] ?? '',
      isTwitterblue: map['isTwitterblue'] ?? false,
      followers: List<String>.from(map['followers']),
      followings: List<String>.from(map['followings']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModels.fromJson(String source) =>
      UserModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModels(email: $email, name: $name, profilePic: $profilePic, bannerPic: $bannerPic, uid: $uid, bio: $bio, isTwitterblue: $isTwitterblue, followers: $followers, followings: $followings)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModels &&
        other.email == email &&
        other.name == name &&
        other.profilePic == profilePic &&
        other.bannerPic == bannerPic &&
        other.uid == uid &&
        other.bio == bio &&
        other.isTwitterblue == isTwitterblue &&
        listEquals(other.followers, followers) &&
        listEquals(other.followings, followings);
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        profilePic.hashCode ^
        bannerPic.hashCode ^
        uid.hashCode ^
        bio.hashCode ^
        isTwitterblue.hashCode ^
        followers.hashCode ^
        followings.hashCode;
  }
}
