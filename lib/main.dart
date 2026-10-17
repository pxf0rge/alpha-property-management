import 'package:alphabeta/core/theme/theme_cubit.dart';
import 'package:alphabeta/features/auth/domain/cubits/auth_cubit.dart';
import 'package:alphabeta/features/listings/domain/cubits/favorite_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/listings/presentation/pages/listings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('ar')],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => FavoriteCubit()),
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => AuthCubit()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Property Listings',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeCubit.state,
      home: const ListingsPage(),
      debugShowCheckedModeBanner: false,
      // RTL support is handled automatically by Directionality
    );
  }
}
