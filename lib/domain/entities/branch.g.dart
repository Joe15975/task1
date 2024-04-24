// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      branch: json['branch'] as int,
      customNo: json['customNo'] as int,
      arabicName: json['arabicName'] as String,
      arabicDescription: json['arabicDescription'] as String,
      englishName: json['englishName'] as String,
      englishDescription: json['englishDescription'] as String,
      note: json['note'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'branch': instance.branch,
      'customNo': instance.customNo,
      'arabicName': instance.arabicName,
      'arabicDescription': instance.arabicDescription,
      'englishName': instance.englishName,
      'englishDescription': instance.englishDescription,
      'note': instance.note,
      'address': instance.address,
    };
