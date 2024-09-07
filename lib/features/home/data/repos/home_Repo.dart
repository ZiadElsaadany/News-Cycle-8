import 'package:dartz/dartz.dart';
import 'package:news_api_cycle_8/core/errors/failure.dart';

import '../models/new_model.dart';

abstract class HomeRepo {


 Future<Either<Failure,List<NewModel>>> getTopHeadline();


}