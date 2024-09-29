import 'package:equatable/equatable.dart';

class NewModel extends Equatable{
  final String? title;
  final String ?desc;
  final String ?content;
  final String ?urlToImage;
  final String ?url;
  final String ?publishedAt;
  final SourceModel sourceModel;
  bool bookMark ;

  NewModel({required this.title, required this.desc, required this.content, required this.urlToImage, required this.url, required this.publishedAt, required this.sourceModel,

  this.bookMark= false
  });

  @override
  List<Object?> get props =>[
  title,
    desc,
    content,
    urlToImage,
    url,
    publishedAt,
    sourceModel

  ];

/// Set  numbers = {1,1,1,2,3}
}




class SourceModel extends Equatable {
  final String? id;
  final String? name ;

  SourceModel({required this.id, required this.name});

  @override
  List<Object?> get props =>
      [
        id,
        name
      ]
  ;


}