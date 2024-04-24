
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
  final int branch;
  final int customNo;

  final String arabicName;
  final String arabicDescription;
  final String englishName;
  final String englishDescription;
  final String note;
  final String address;

  const Branch({
    required this.branch,
    required this.customNo,
    required this.arabicName,
    required this.arabicDescription,
    required this.englishName,
    required this.englishDescription,
    required this.note,
    required this.address,
  });

  factory Branch.empty() => const Branch(
    branch: 0,
    customNo: 0,
    arabicName: '',
    arabicDescription: '',
    englishName: '',
    englishDescription: '',
    note: '',
    address: '',
  );

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}

enum BranchFields {
  branch,
  customNo,
  arabicName,
  arabicDescription,
  englishName,
  englishDescription,
  note,
  address,
}