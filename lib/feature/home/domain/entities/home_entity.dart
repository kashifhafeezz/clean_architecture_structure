import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  const HomeEntity({
    this.id,
    this.title,
    this.subTitle,
    this.image,
  });

  final int? id;
  final String? title;
  final String? subTitle;
  final String? image;

  @override
  List<Object?> get props => [id, title, subTitle, image];
}
