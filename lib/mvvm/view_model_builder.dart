import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/mvvm/base_view_model.dart';

typedef ViewEvent<T extends BaseViewModel> = void Function(T viewModel, BuildContext context);
typedef CustomizedWidgetBuilder<T extends ChangeNotifier> = Widget Function(
    BuildContext context, T viewModel, Widget? widget);

class ViewModelBuilder<T extends BaseViewModel> extends StatefulWidget {
  final T _viewModel;
  final CustomizedWidgetBuilder<T> _builder;
  final ViewEvent<T>? _onViewMount;

  const ViewModelBuilder({
    required T viewModel,
    required CustomizedWidgetBuilder<T> builder,
    Key? key,
    ViewEvent<T>? onViewMount,
  })  : _viewModel = viewModel,
        _builder = builder,
        _onViewMount = onViewMount,
        super(key: key);

  @override
  ViewModelBuilderState createState() => ViewModelBuilderState<T>();
}

class ViewModelBuilderState<T extends BaseViewModel> extends State<ViewModelBuilder<T>> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._onViewMount?.call(widget._viewModel, context);
      widget._viewModel.onViewMount();
    });
    widget._viewModel.onViewInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._viewModel.onViewDispose();
    });
    widget._viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget._viewModel,
      child: Consumer<T>(
        builder: widget._builder,
      ),
    );
  }
}
