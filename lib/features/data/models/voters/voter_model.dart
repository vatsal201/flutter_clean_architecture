import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voter_model.g.dart';

@JsonSerializable()
class VoterModel extends VoterEntity {
  const VoterModel({
    String acNo = '',
    String partNo = '',
    String srNo = '',
    String voterName = '',
    String voterNameEn = '',
    String idCardNo = '',
    String gender = '',
    String age = '',
    String empty = '',
  }) : super(
            acNo: acNo,
            partNo: partNo,
            srNo: srNo,
            voterName: voterName,
            voterNameEn: voterNameEn,
            idCardNo: idCardNo,
            gender: gender,
            age: age,
            empty: empty);

  factory VoterModel.fromJson(Map<String, dynamic> json) =>
      _$VoterModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoterModelToJson(this);
}
