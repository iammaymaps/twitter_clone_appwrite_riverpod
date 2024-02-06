import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/assets_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsConstants.twitterLogo),
    );
  }
}
