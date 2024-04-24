
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/presentation/widgets/app_text_form_field.dart';

import 'add_branch_vm.dart';

class AddBranchPortraitView extends ConsumerWidget {
  final ChangeNotifierProvider<AddBranchVM> cnProvider;
  // final Person? person;

  const AddBranchPortraitView({
    super.key,
    required this.cnProvider,
    // this.person
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cnProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Branch'),
        actions: [
          IconButton(
            onPressed: () async {
              await provider.save();
              context.pop();
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: provider.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AppTextFormField(
                      controller: provider.branchController,
                      hint: 'Branch',
                      readOnly: true,
                    )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 3,
                    child: AppTextFormField(
                      controller: provider.customNoController,
                      hint: 'Custom No.',
                      keyboardType: TextInputType.number,
                    )
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.arabicNameController,
                hint: 'Arabic Name',
                isArabic: true,
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.arabicDescriptionController,
                hint: 'Arabic Description',
                isArabic: true,
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.englishNameController,
                hint: 'English Name',
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.englishDescriptionController,
                hint: 'English Description',
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.notesController,
                hint: 'Notes',
              ),
              const SizedBox(height: 10,),
              AppTextFormField(
                controller: provider.addressController,
                hint: 'Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
