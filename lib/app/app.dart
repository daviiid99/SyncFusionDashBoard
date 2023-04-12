import 'package:niveles_formacion/view/dashboard/dashboard_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  //Initial route is set to be the DashboardView
  StackedRoute(page: DashboardView, initial: true),
])
class App {}
