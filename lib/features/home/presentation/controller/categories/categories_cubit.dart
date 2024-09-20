import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());




  int categoryIndex = 0 ;
  changeIndex( int index ) {
    categoryIndex = index ;
    emit(ChangeColorState());
  }


}
