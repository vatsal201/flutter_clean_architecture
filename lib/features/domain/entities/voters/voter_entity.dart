import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VoterEntity extends Equatable {
  @JsonKey(name: 'ac no')
  final String acNo;
  @JsonKey(name: 'part no')
  final String partNo;
  @JsonKey(name: 'sr no')
  final String srNo;
  @JsonKey(name: 'voter name')
  final String voterName;
  @JsonKey(name: 'voter name en')
  final String voterNameEn;
  @JsonKey(name: 'id card no')
  final String idCardNo;
  final String gender;
  final String age;
  @JsonKey(name: ' ')
  final String empty;

  const VoterEntity({
    required this.acNo,
    required this.partNo,
    required this.srNo,
    required this.voterName,
    required this.voterNameEn,
    required this.idCardNo,
    required this.gender,
    required this.age,
    required this.empty,
  });

  @override
  List<Object?> get props {
    return [
      acNo,
      partNo,
      srNo,
      voterName,
      voterNameEn,
      idCardNo,
      gender,
      age,
      empty,
    ];
  }
}
