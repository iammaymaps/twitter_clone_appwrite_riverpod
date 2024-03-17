import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/UI_constants.dart';
import 'package:twitter_clone_appwrite_riverpod/constants/assets_constants.dart';
import 'package:twitter_clone_appwrite_riverpod/theme/pallete.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});
  static const routeName = '/home-screen';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _page = 0;

  void onPagecreation(int index) {
    setState(() {
      _page = index;
    });
  }

  final appbar = UIConstants.appBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Pallete.whiteColor,
            size: 28,
          ),
        ),
        appBar: _page == 0 ? appbar : null,
        bottomNavigationBar: CupertinoTabBar(
            onTap: onPagecreation,
            backgroundColor: Pallete.backgroundColor,
            currentIndex: _page,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _page == 0
                      ? AssetsConstants.homeFilledIcon
                      : AssetsConstants.homeOutlinedIcon,
                  color: Pallete.whiteColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsConstants.searchIcon,
                  color: Pallete.whiteColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _page == 2
                      ? AssetsConstants.notifFilledIcon
                      : AssetsConstants.notifOutlinedIcon,
                  color: Pallete.whiteColor,
                ),
              ),
            ]),
        body: IndexedStack(
          index: _page,
          children: UIConstants.bottomTapBarPages,
        ));
  }
}
