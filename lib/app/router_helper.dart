
import 'package:go_router/go_router.dart';
import 'package:test1/presentation/screens/add_branch_screen/add_branch_screen.dart';
import 'package:test1/presentation/screens/homescreen/home_screen.dart';

import '../domain/entities/branch.dart';
import '../presentation/base/providers.dart';

class RouterHelper {
  
  static final router = GoRouter(
    initialLocation: "/${Routes.home.name}",
    routes: [
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        builder: (context, state) {
          return HomeScreen(
            cnProvider: ProviderVM.homeVM,
          );
        },
      ),
      GoRoute(
        name: Routes.addBranch.name,
        path: Routes.addBranch.path,
        builder: (context, state) {
          return AddBranchScreen(cnProvider: ProviderVM().addBranchCN(state.extra as Branch?));
        },
      ),
    ]
  );
  
}

enum Routes {
  home,
  addBranch;

  String get path {
    return '/$name';
  }
}