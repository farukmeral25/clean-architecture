import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  const BaseView({Key? key, required this.viewModel, required this.onPageBuilder, this.onModelReady, this.onDispose})
      : super(key: key);

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    widget.onModelReady ?? (widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
