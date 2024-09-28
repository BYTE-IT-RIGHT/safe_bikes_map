import 'package:auto_route/auto_route.dart';
import 'package:safe_bikes_map/dashboard/presentation/dashboard_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
      ];
}
