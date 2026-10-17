import 'package:alphabeta/core/theme/app_colors.dart';
import 'package:alphabeta/core/theme/theme_cubit.dart';
import 'package:alphabeta/features/auth/domain/cubits/auth_cubit.dart';
import 'package:alphabeta/features/auth/presentation/pages/login_page.dart';
import 'package:alphabeta/features/settings/presentation/widgets/common_badge.dart';
import 'package:alphabeta/widgets/common_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authCubit = context.watch<AuthCubit>(); // Watch auth state
    final isLoggedIn = authCubit.state; // Get isLoggedIn

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: CommonSvgIcon(
          assetName: isDark ? 'fake logo dark.svg' : 'fake logo white.svg',
          size: 48,
          color: AppColors.blue,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 30),
              if (isLoggedIn) ...[
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'user big.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('profile'.tr()),
                  onTap: () {},
                ),
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'new listing.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('add_listing'.tr()),
                  onTap: () {},
                ),
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'heart big.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('saved'.tr()),
                  trailing: const CommonBadge(count: 6, color: Colors.blue),
                  onTap: () {},
                ),
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'bookmark.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('searchs'.tr()),
                  trailing: const CommonBadge(count: 4, color: Colors.pink),
                  onTap: () {},
                ),
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'listing.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('listing'.tr()),
                  trailing: const CommonBadge(count: 6, color: Colors.green),
                  onTap: () {},
                ),
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'settings.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('settings'.tr()),
                  onTap: () {},
                ),
              ],
              ListTile(
                leading: CommonSvgIcon(
                  assetName: 'information.svg',
                  color: isDark ? Colors.white : Colors.black,
                ),
                title: Text('help'.tr()),
                onTap: () {},
              ),
              ListTile(
                title: Text(isDark ? 'light_mode'.tr() : 'dark_mode'.tr()),
                leading: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                ),
                onTap: () => themeCubit.toggleTheme(!isDark),
              ),
              if (isLoggedIn) ...[
                ListTile(
                  leading: CommonSvgIcon(
                    assetName: 'logout.svg',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text('logout'.tr()),
                  onTap: () {
                    authCubit.logout();
                  },
                ),
              ],
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(
                  context.locale == context.supportedLocales[1]
                      ? 'English'
                      : "عربی",
                ),
                onTap: () {
                  if (context.locale == context.supportedLocales[1]) {
                    context.setLocale(context.supportedLocales[0]);
                  } else {
                    context.setLocale(context.supportedLocales[1]);
                  }
                },
              ),
            ],
          ),
          if (!isLoggedIn)
            Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("signin".tr()),
              ),
            ),
        ],
      ),
    );
  }
}
