
import 'package:flutter/material.dart';
import 'package:test1/domain/entities/branch.dart';
import 'package:test1/domain/use-cases/create_branch_uc.dart';
import 'package:test1/presentation/base/basevm.dart';

import '../../../domain/use-cases/update_branch_uc.dart';

class AddBranchVM extends BaseVM implements _AddPersonUI {


  @override
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  TextEditingController addressController = TextEditingController();

  @override
  TextEditingController arabicDescriptionController = TextEditingController();

  @override
  TextEditingController arabicNameController = TextEditingController();

  @override
  TextEditingController branchController = TextEditingController();

  @override
  TextEditingController customNoController = TextEditingController();

  @override
  TextEditingController englishDescriptionController = TextEditingController();

  @override
  TextEditingController englishNameController = TextEditingController();

  @override
  TextEditingController notesController = TextEditingController();

  Branch? editBranch;

  Future<void> init(Branch? branch) async {
    editBranch = branch;



    if (editBranch == null){
      customNoController.text = (DateTime
          .now()
          .millisecondsSinceEpoch ~/ 1015).toString();

      branchController.text = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
    }else {
      branchController.text = editBranch!.branch.toString();
      customNoController.text = editBranch!.customNo.toString();
      arabicNameController.text = editBranch!.arabicName;
      arabicDescriptionController.text = editBranch!.arabicDescription;
      englishNameController.text = editBranch!.englishName;
      englishDescriptionController.text = editBranch!.englishDescription;
      notesController.text = editBranch!.note;
      addressController.text = editBranch!.address;
    }
    notifyListeners();

}


  Future<void> save() async {
    if(!formKey.currentState!.validate()){
      return;
    }

    final branch = Branch(
        branch: int.tryParse(branchController.text.trim()) ?? 0,
        customNo: int.tryParse(customNoController.text.trim()) ?? 0,
        arabicName: arabicNameController.text.trim(),
        arabicDescription: arabicDescriptionController.text.trim(),
        englishName: englishNameController.text.trim(),
        englishDescription: englishDescriptionController.text.trim(),
        note: notesController.text.trim(),
        address: addressController.text.trim()
    );

    if (editBranch != null) {
      await UpdateBranchUC(branch: branch).execute();
    } else {
      await CreateBranchUC(branch: branch).execute();
    }

  }

}
abstract class _AddPersonUI{
  late TextEditingController branchController;
  late TextEditingController customNoController;
  late TextEditingController arabicNameController;
  late TextEditingController arabicDescriptionController;
  late TextEditingController englishNameController;
  late TextEditingController englishDescriptionController;
  late TextEditingController notesController;
  late TextEditingController addressController;


  late GlobalKey<FormState> formKey;

}