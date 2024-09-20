import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';

import 'book_mark_states.dart';

class BookMarkCubit extends Cubit<BookMarkStates> {
  BookMarkCubit() : super(BookMarkInitialState());




  changeBookMark( NewModel newModel) {
    newModel.bookMark =!newModel.bookMark;
    if(newModel.bookMark)  {
      addToBookMarks(newModel: newModel);

    }else{
      removeToBookMarks(newModel: newModel);

    }
    emit(ChangeBookMarksColor());
  }

  List<NewModel>  bookMarks =[ ];

  addToBookMarks(  {
    required  NewModel newModel
}){
      bookMarks.add(newModel);


  }
  removeToBookMarks (
  {
    required NewModel newModel
}
      ) {

      bookMarks.remove(newModel);


  }
}
