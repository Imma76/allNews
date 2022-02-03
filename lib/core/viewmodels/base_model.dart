
import 'package:all_news/ui/views/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseModel extends ChangeNotifier{
  ViewState viewState = ViewState.Idle;
void setState(ViewState newState){
  viewState = newState;
  notifyListeners();
}

}