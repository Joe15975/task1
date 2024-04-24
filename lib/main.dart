import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/app/router_helper.dart';
import 'package:test1/presentation/base/theme.dart';

import 'data/local/data_source/branch_database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await BranchDatabaseSource().initializeDB();

  runApp(
      ProviderScope(
      child: SafeArea(
        child: MaterialApp.router(
          routerConfig: RouterHelper.router,
          theme: ThemeManager.themeData,
        ),
      ),
    )
  );
}