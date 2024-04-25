
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../base/providers.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/page_switcher_widget.dart';
import 'add_branch_vm.dart';

class AddBranchLandscapeView extends ConsumerWidget {
  final ChangeNotifierProvider<AddBranchVM> cnProvider;
  // final Person? person;

  const AddBranchLandscapeView({
    super.key,
    required this.cnProvider,
    // this.person
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cnProvider);
    final homeProvider = ref.read(ProviderVM.homeVM);

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
                      child: AppTextFormField(
                        controller: provider.branchController,
                        hint: 'Branch',
                        readOnly: true,
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: AppTextFormField(
                        controller: provider.customNoController,
                        hint: 'Custom No.',
                      )
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.arabicNameController,
                      hint: 'Arabic Name',
                      isArabic: true,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.arabicDescriptionController,
                      hint: 'Arabic Description',
                      isArabic: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.englishNameController,
                      hint: 'English Name',
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.englishDescriptionController,
                      hint: 'English Description',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.notesController,
                      hint: 'Notes',
                      isBig: true,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: AppTextFormField(
                      controller: provider.addressController,
                      isBig: true,
                      hint: 'Address',
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              PageSwitcherWidget(
                currentPage: homeProvider.getBranchIndexByBranchId(int.parse(provider.branchController.text)) + 1,
                totalPages: homeProvider.branches.length,
                onNextPageClicked: (){
                  provider.nextPage(ref);
                },
                onPreviousPageClicked: (){
                  provider.previousPage(ref);
                },
                onFirstPageClicked: (){
                  provider.firstPage(ref);
                },
                onLastPageClicked: (){
                  provider.lastPage(ref);
                },
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
