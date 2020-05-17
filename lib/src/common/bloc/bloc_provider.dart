
import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/common/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  const BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends Bloc>(BuildContext context){
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType();
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }
}