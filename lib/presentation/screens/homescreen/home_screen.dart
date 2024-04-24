
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/app/router_helper.dart';
import 'package:test1/presentation/screens/homescreen/home_vm.dart';
import 'package:test1/presentation/widgets/branch_widget.dart';

class HomeScreen extends ConsumerWidget {
  final ChangeNotifierProvider<HomeVM> cnProvider;
  const HomeScreen({
    super.key,
    required this.cnProvider
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cnProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branches'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.addBranch.name).then((value) {
                provider.getBranches();
              });
            },
            icon: const Icon(Icons.add_circle),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: provider.branches.length,
            itemBuilder: (context, index) {
              return BranchWidget(
                branch: provider.branches.elementAt(index),
                onEditeClicked: () {
                  provider
                      .editeBranch(context, provider.branches.elementAt(index));
                },
                onDelete: () {
                  provider.deleteBranch(
                    provider.branches.elementAt(index),
                  );
                },
              );
            },
        ),
      ),
    );
  }
}
