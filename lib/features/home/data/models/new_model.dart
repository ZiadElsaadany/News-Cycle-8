import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:news_api_cycle_8/features/home/data/models/source_model.dart';
part "new_model.g.dart";
@HiveType(typeId: 0)
class NewModel extends Equatable{
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String ?desc;
  @HiveField(2)
  final String ?content;
  @HiveField(3)
  final String ?urlToImage;
  @HiveField(4)
  final String ?url;
  @HiveField(5)
  final String ?publishedAt;
  @HiveField(6)
  final SourceModel sourceModel;
  @HiveField(7)
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




