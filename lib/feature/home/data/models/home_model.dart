import 'package:json_annotation/json_annotation.dart';
import 'package:vg_cli/feature/home/domain/entities/home_entity.dart';

part 'home_model.g.dart';

@JsonSerializable(checked: true)
class HomeModel extends HomeEntity {
  const HomeModel({
    this.id,
    this.title,
    this.subTitle,
    this.image,
  }) : super(id: id, title: title, subTitle: subTitle, image: image);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @JsonKey(name: 'image')
  final String? image;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
