import 'package:aora_new/dependencies.dart';
import 'package:aora_new/router/router.dart';
import 'package:aora_new/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  initDependencies();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final router = ref.watch(routerProvider);
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.mainTheme,
        routerConfig: router,
      );
    });
  }
}
