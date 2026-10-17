import 'package:alphabeta/core/theme/app_colors.dart';
import 'package:alphabeta/features/settings/presentation/pages/settings_page.dart';
import 'package:alphabeta/widgets/common_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/property_card.dart';

class ListingsPage extends StatelessWidget {
  const ListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildStickyHeader(context),
          _buildListingsHeader(context),
          _buildPropertyCardsList(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSearchColor : Color(0xffF0F4FE),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  CommonSvgIcon(
                    assetName: 'location sm.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'location_tag'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: CommonSvgIcon(
                  assetName: 'filter.svg',
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                icon: CommonSvgIcon(
                  assetName: 'menu.svg',
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildStickyHeader(BuildContext context) {
    return SliverAppBar(
      floating: true,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      pinned: true,
      snap: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(child: _buildHeader(context)),
    );
  }

  SliverToBoxAdapter _buildListingsHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      const TextSpan(
                        text: '2,356 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'listing'.tr()),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'sort'.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 3),
                    const CommonSvgIcon(assetName: 'sort by.svg'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  SliverList _buildPropertyCardsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: PropertyCard(index: index),
        );
      }, childCount: 5),
    );
  }
}
