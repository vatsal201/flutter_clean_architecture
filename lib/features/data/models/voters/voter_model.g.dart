// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoterModel _$VoterModelFromJson(Map<String, dynamic> json) => VoterModel(
      acNo: json['ac no'] as String? ?? '',
      partNo: json['part no'] as String? ?? '',
      srNo: json['sr no'] as String? ?? '',
      voterName: json['voter name'] as String? ?? '',
      voterNameEn: json['voter name en'] as String? ?? '',
      idCardNo: json['id card no'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      age: json['age'] as String? ?? '',
      empty: json[' '] as String? ?? '',
    );

Map<String, dynamic> _$VoterModelToJson(VoterModel instance) =>
    <String, dynamic>{
      'ac no': instance.acNo,
      'part no': instance.partNo,
      'sr no': instance.srNo,
      'voter name': instance.voterName,
      'voter name en': instance.voterNameEn,
      'id card no': instance.idCardNo,
      'gender': instance.gender,
      'age': instance.age,
      ' ': instance.empty,
    };
