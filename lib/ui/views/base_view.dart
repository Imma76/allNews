
import 'package:all_news/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Function(BuildContext context, T value, Widget child)builder;
  final Function(T) onReady;
  BaseView({this.builder, this.onReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
 T model = getLocator<T>();
@override
  void initState() {
    if(widget.onReady != null){
      widget.onReady(model);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(value: model, child: Consumer<T>(builder: widget.builder,),);
    //(
      
      //create
      //: (context)=> model,
     // child: Consumer<T>(builder: widget.builder,),
    //);
  }
}