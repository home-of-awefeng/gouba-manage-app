import 'package:flutter/cupertino.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import 'package:shop_app/mvvm/view_model_builder.dart';

abstract class ViewModelWidget<T extends BaseViewModel> extends StatelessWidget {
  @protected
  final T viewModel;

  const ViewModelWidget(this.viewModel, {Key? key}) : super(key: key);

  String? get keyValue => (key as ValueKey?)?.value;

  @protected
  void onViewMount(BuildContext context) {}

  Widget render(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<T>(
      viewModel: viewModel,
      onViewMount: (T viewModel, BuildContext context) => onViewMount(context),
      builder: (BuildContext context, T viewModel, Widget? widget) => render(context),
    );
  }
}
