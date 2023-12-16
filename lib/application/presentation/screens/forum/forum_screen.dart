import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/challenges_tab.dart';
import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/featured_topic_tab.dart';
import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/groups_forum_tab.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenForum extends StatelessWidget {
  const ScreenForum({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appbarForum(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(children: [
            FeaturedTopic(),
            ChallengesForum(title: 'Upcoming Challenges'),
            GroupsForum(),
          ]),
        ),
      ),
    );
  }

  AppBar _appbarForum() {
    return AppBar(
        elevation: 0,
        title: Text(
          'Forum',
          style: cabin(fontSize: 0.08, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(kRadius50),
                  border: Border.all(color: kGreen)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: kGreen,
                  ))),
          kWidth20
        ],
        bottom: PreferredSize(
          preferredSize: Size(sWidth, sHeight * 0.08),
          child: TabBar(
             // dividerHeight: 0,
              isScrollable: true,
              indicator: const BoxDecoration(
                  color: kGreen, borderRadius: BorderRadius.all(kRadius50)),
              labelStyle: cabin(fontSize: 0.04, fontWeight: FontWeight.bold),
              labelColor: kBlack,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
              tabs: const [
                Tab(
                  text: 'Featured Topic',
                ),
                Tab(
                  text: 'Challenges',
                ),
                Tab(
                  text: 'Groups',
                ),
              ]),
        ),
      );
  }
}
