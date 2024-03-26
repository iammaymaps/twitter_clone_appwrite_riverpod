import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:twitter_clone_appwrite_riverpod/core/tweet_type_enum.dart';

class TweetModels {
  final String text;
  final String link;
  final String uid;
  final String retweetedBy;
  final String repliedTo;
  final int reshareCount;
  final String id;
  final TweetType type;
  final List<String> hashtag;
  final List<String> imageLinks;
  final List<String> likes;
  final List<String> commentIds;
  final DateTime tweetedAt;
  TweetModels({
    required this.text,
    required this.link,
    required this.uid,
    required this.retweetedBy,
    required this.repliedTo,
    required this.reshareCount,
    required this.id,
    required this.type,
    required this.hashtag,
    required this.imageLinks,
    required this.likes,
    required this.commentIds,
    required this.tweetedAt,
  });

  TweetModels copyWith({
    String? text,
    String? link,
    String? uid,
    String? retweetedBy,
    String? repliedTo,
    int? reshareCount,
    String? id,
    TweetType? type,
    List<String>? hashtag,
    List<String>? imageLinks,
    List<String>? likes,
    List<String>? commentIds,
    DateTime? tweetedAt,
  }) {
    return TweetModels(
      text: text ?? this.text,
      link: link ?? this.link,
      uid: uid ?? this.uid,
      retweetedBy: retweetedBy ?? this.retweetedBy,
      repliedTo: repliedTo ?? this.repliedTo,
      reshareCount: reshareCount ?? this.reshareCount,
      id: id ?? this.id,
      type: type ?? this.type,
      hashtag: hashtag ?? this.hashtag,
      imageLinks: imageLinks ?? this.imageLinks,
      likes: likes ?? this.likes,
      commentIds: commentIds ?? this.commentIds,
      tweetedAt: tweetedAt ?? this.tweetedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'link': link,
      'uid': uid,
      'retweetedBy': retweetedBy,
      'repliedTo': repliedTo,
      'reshareCount': reshareCount,
      'type': type.type,
      'hashtag': hashtag,
      'imageLinks': imageLinks,
      'likes': likes,
      'commentIds': commentIds,
      'tweetedAt': tweetedAt.millisecondsSinceEpoch,
    };
  }

  factory TweetModels.fromMap(Map<String, dynamic> map) {
    return TweetModels(
      text: map['text'] ?? '',
      link: map['link'] ?? '',
      uid: map['uid'] ?? '',
      retweetedBy: map['retweetedBy'] ?? '',
      repliedTo: map['repliedTo'] ?? '',
      reshareCount: map['reshareCount']?.toInt() ?? 0,
      id: map['\$id'] ?? '',
      type: (map['tweetType'] as String).toTweetTypeEnum(),
      hashtag: List<String>.from(map['hashtag']),
      imageLinks: List<String>.from(map['imageLinks']),
      likes: List<String>.from(map['likes']),
      commentIds: List<String>.from(map['commentIds']),
      tweetedAt: DateTime.fromMillisecondsSinceEpoch(map['tweetedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TweetModels.fromJson(String source) =>
      TweetModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TweetModels(text: $text, link: $link, uid: $uid, retweetedBy: $retweetedBy, repliedTo: $repliedTo, reshareCount: $reshareCount, id: $id, type: $type, hashtag: $hashtag, imageLinks: $imageLinks, likes: $likes, commentIds: $commentIds, tweetedAt: $tweetedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TweetModels &&
        other.text == text &&
        other.link == link &&
        other.uid == uid &&
        other.retweetedBy == retweetedBy &&
        other.repliedTo == repliedTo &&
        other.reshareCount == reshareCount &&
        other.id == id &&
        other.type == type &&
        listEquals(other.hashtag, hashtag) &&
        listEquals(other.imageLinks, imageLinks) &&
        listEquals(other.likes, likes) &&
        listEquals(other.commentIds, commentIds) &&
        other.tweetedAt == tweetedAt;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        link.hashCode ^
        uid.hashCode ^
        retweetedBy.hashCode ^
        repliedTo.hashCode ^
        reshareCount.hashCode ^
        id.hashCode ^
        type.hashCode ^
        hashtag.hashCode ^
        imageLinks.hashCode ^
        likes.hashCode ^
        commentIds.hashCode ^
        tweetedAt.hashCode;
  }
}
