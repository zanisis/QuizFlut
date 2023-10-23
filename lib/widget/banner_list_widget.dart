import 'package:edproject/model/banner_model.dart';
import 'package:flutter/material.dart';

class BannerListWidget extends StatelessWidget {
  final List<BannerData> bannerList;
  const BannerListWidget({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bannerData = bannerList[index];

          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              bannerData.eventImage ?? '',
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 28),
        itemCount: bannerList.length);
  }
}
