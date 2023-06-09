import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di_container.dart';
import 'base_model.dart';

class BaseView<VM extends BaseModel> extends StatefulWidget {
  const BaseView({
    Key? key,
    this.onModelReady,
    required this.builder,
    this.onModelDispose,
  }) : super(key: key);
  final Function(VM)? onModelReady;
  final Function(VM)? onModelDispose;
  final Widget Function(
    BuildContext context,
    VM model,
    Widget? child,
  ) builder;

  @override
  _BaseViewState<VM> createState() => _BaseViewState();
}

class _BaseViewState<VM extends BaseModel> extends State<BaseView<VM>> {
  final VM _model = locator<VM>();
  @override
  void initState() {
    super.initState();

    if (widget.onModelReady != null) {
      widget.onModelReady!(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: Consumer<VM>(builder: widget.builder),
    );
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(_model);
    }
    super.dispose();
  }
}
