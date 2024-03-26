import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_appwrite_riverpod/core/utils.dart';

class TweetController extends StateNotifier<bool> {
  TweetController() : super(false);

  void shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) {
    if (text.isNotEmpty) {
      showSnackBar(context, "Please enter text");
      return;
    }
    if (images.isNotEmpty) {
    } else {}
  }

  void _shareImageTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async {
    state = true;
    final hashtags = _getHashtagFromText(text);
    String link = _getLinkFromText(text);
  }

  void _shareTextTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async {
    state = true;
    final hashtags = _getHashtagFromText(text);
    String link = _getLinkFromText(text);
  }

  String _getLinkFromText(String text) {
    String link = '';
    List<String> wordInSentence = text.split(' ');

    for (String word in wordInSentence) {
      if (word.startsWith('https://') || word.startsWith('www.')) {
        link = word;
      }
    }
    return link;
  }

  List<String> _getHashtagFromText(String text) {
    List<String> hashtag = [];
    List<String> wordInSentence = text.split(' ');

    for (String word in wordInSentence) {
      if (word.startsWith('#')) {
        hashtag.add(word);
      }
    }
    return hashtag;
  }
}
