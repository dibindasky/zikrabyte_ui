import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/group_detail.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class GroupsForum extends StatelessWidget {
  const GroupsForum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'All Groups',
              style: cabin(fontSize: 0.06),
            ),
            const Spacer(),
            const Icon(Icons.sort)
          ],
        ),
        kHeight10,
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) => kHeight5,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(onTap: (){
            pushNewScreen(context, screen: ScreenGroupDetail(title:'${country[index]} Food Lovers'),withNavBar: false);
          },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(imagesList[index]),
              ),
              title: Text(
                '${country[index]} Food Lovers',
                style: cabin(fontSize: 0.05),
              ),
              subtitle: Text(
                '22.5K Members',
                style: montserrat(),
              ),
              trailing: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: sWidth * 0.25,
                decoration: BoxDecoration(
                  color: index % 2 != 0 ? kGreen : kWhite,
                  border: Border.all(color: kGreen),
                  borderRadius: const BorderRadius.all(kRadius50),
                ),
                child: Center(
                    child: Text(
                  index % 2 != 0 ? 'Joined' : 'Join',
                  style: cabin(
                      fontSize: 0.04, color: index % 2 != 0 ? kWhite : kGreen),
                )),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
