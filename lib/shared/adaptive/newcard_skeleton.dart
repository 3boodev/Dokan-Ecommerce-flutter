import 'package:dokan/shared/adaptive/skeleton.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding),
          const Skeleton(height: 40, width: double.infinity),
          const SizedBox(height: defaultPadding),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleSkeleton(),
                const SizedBox(width: defaultPadding / 8),
                const CircleSkeleton(),
                const SizedBox(width: defaultPadding / 8),
                const CircleSkeleton(),
                const SizedBox(width: defaultPadding / 8),
                const CircleSkeleton(),
                const SizedBox(width: defaultPadding / 8),
                const CircleSkeleton(),
                const SizedBox(width: defaultPadding / 8),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              const Skeleton(height: 40, width: 100),
              SizedBox(width: defaultPadding/4),
              const Skeleton(height: 40, width: 100),
            ],
          ),

          const SizedBox(height: defaultPadding/2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Skeleton(width: double.infinity/2,height: 180,),
              SizedBox(width: defaultPadding/4),
              Skeleton(width: double.infinity/2,height: 180,),
            ],
          ),
          const SizedBox(height: defaultPadding/2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Skeleton(width: double.infinity/2,height: 180,),
              SizedBox(width: defaultPadding/4),
              Skeleton(width: double.infinity/2,height: 180,),
            ],
          )
        ],
      ),
    );
  }
}