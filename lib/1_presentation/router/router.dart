import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/1_presentation/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page,  path: '/'),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SignInRoute.page,), 
    AutoRoute(page: HomeRoute.page,),
  ];
}