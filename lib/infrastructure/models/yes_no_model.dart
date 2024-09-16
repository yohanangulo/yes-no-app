// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  String answer;
  bool forced;
  String image;

  Message toMessageEntity() {
    return Message(
      text: answer,
      imageUrl: image,
      fromWho: FromWho.him,
    );
  }

  YesNoModel copyWith({
    String? answer,
    bool? forced,
    String? image,
  }) {
    return YesNoModel(
      answer: answer ?? this.answer,
      forced: forced ?? this.forced,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'forced': forced,
      'image': image,
    };
  }

  factory YesNoModel.fromMap(Map<String, dynamic> map) {
    return YesNoModel(
      answer: map['answer'] as String,
      forced: map['forced'] as bool,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YesNoModel.fromJson(String source) => YesNoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'YesNoModel(answer: $answer, forced: $forced, image: $image)';

  @override
  bool operator ==(covariant YesNoModel other) {
    if (identical(this, other)) return true;

    return other.answer == answer && other.forced == forced && other.image == image;
  }

  @override
  int get hashCode => answer.hashCode ^ forced.hashCode ^ image.hashCode;
}
