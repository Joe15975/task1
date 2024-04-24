import 'package:flutter/material.dart';

import '../../domain/entities/branch.dart';

class BranchWidget extends StatelessWidget {

  final Branch branch;
  final void Function() onEditeClicked;
  final void Function() onDelete;

  const BranchWidget({
    super.key,
    required this.branch,
    required this.onEditeClicked,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        onDelete.call();
      },
      background: Container(
        color: Colors.red,
      ),
      key: UniqueKey(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(branch.branch.toString()),
                const SizedBox(height: 10,),
                Text(branch.customNo.toString()),
                const SizedBox(height: 10,),
                Text(branch.arabicName),
                const SizedBox(height: 10,),
                Text(branch.arabicDescription),
                const SizedBox(height: 10,),
                Text(branch.englishName),
                const SizedBox(height: 20,),
                Text(branch.englishDescription),
                const SizedBox(height: 20,),
                Text(branch.note),
                const SizedBox(height: 20,),
                Text(branch.address),
                const SizedBox(height: 20,),
                IconButton(
                    onPressed: () {
                      onEditeClicked.call();
                    },
                    icon: const Icon(Icons.edit)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
