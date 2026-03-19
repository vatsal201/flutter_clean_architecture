import 'package:flutter_clean_architecture/features/di/di_container.dart';
import 'package:flutter_clean_architecture/features/views/providers/dashboard_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class EProviders {
  static List<SingleChildWidget> eProviders = [
    ChangeNotifierProvider(
      create: (context) => locator<DashboardViewModel>(),
    ),
  ];
}
