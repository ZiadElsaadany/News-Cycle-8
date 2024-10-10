import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_api_cycle_8/core/hive.dart';
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

  var box = Hive.box<NewModel>(AppHive.bookMarkBox);

  addToBookMarks(  {
    required  NewModel newModel
}) async{

      bookMarks.add(newModel);
      await  box.put("${newModel.title}${newModel.publishedAt}", newModel);


  }
  removeToBookMarks (
  {
    required NewModel newModel
}
      ) async{

      bookMarks.remove(newModel);

   await    box.delete("${newModel.title}${newModel.publishedAt}");




  }
  fetchBookMarks() {
    bookMarks = box.values.toList();
  }
}
