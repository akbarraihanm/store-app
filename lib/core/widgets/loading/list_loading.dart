import 'package:flutter/material.dart';
import 'package:store_app/core/config/app_color.dart';
import 'package:store_app/core/config/app_typography.dart';
import 'package:store_app/core/extensions/double_extension.dart';
import 'package:store_app/core/widgets/loading/app_shimmer.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, pos) => const _LoadingItem(),
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Center(
                child: Text(
                  "Loading data",
                  style: AppTypography.copyWith(
                    color: AppColor.blueOcean,
                    size: 12,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        width: 100,
                        color: Colors.white,
                      ),
                      4.spaceHeight,
                      Container(
                        height: 18,
                        width: 200,
                        color: Colors.white,
                      ),
                      4.spaceHeight,
                      Container(
                        height: 16,
                        width: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 24,
                    color: AppColor.blueOcean,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppColor.blueOcean,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 16,
              width: 200,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}