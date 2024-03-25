import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';
import 'package:twitter_clone_appwrite_riverpod/common/loading_page.dart';
import 'package:twitter_clone_appwrite_riverpod/common/rounded_small_button.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/assets_constants.dart';
import 'package:twitter_clone_appwrite_riverpod/core/utils.dart';
import 'package:twitter_clone_appwrite_riverpod/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone_appwrite_riverpod/theme/pallete.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
  const CreateTweetScreen({super.key});
  static const routeName = '/tweet-screen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {
  @override
  final tweetController = TextEditingController();
  List<File> images = [];
  @override
  void dispose() {
    // TODO: implement dispose
    tweetController.dispose();
    super.dispose();
  }

  void onPickImages() async {
    images = await pickFiles();
    setState(() {});
  }

  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 23),
        ),
        actions: [
          RoundedSmallButton(
            onTap: () {},
            label: 'Tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            currentUser.profilePic,
                          ),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: tweetController,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                              hintText: "What's happening",
                              hintStyle: TextStyle(
                                  color: Pallete.greyColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                    if (images.isNotEmpty)
                      CarouselSlider(
                          items: images.map((file) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.file(file));
                          }).toList(),
                          options: CarouselOptions(
                              height: 400, enableInfiniteScroll: false)),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Pallete.greyColor, width: 0.3),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
              child: GestureDetector(
                onTap: onPickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AssetsConstants.gifIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AssetsConstants.emojiIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
