import 'package:go_router/go_router.dart';

import '../view/pages/home_page/home_page.dart';

final routes = GoRouter(
  initialLocation: '/HomePage',
  routes: [
    GoRoute(
      path: '/HomePage',
      builder: (context, state) => HomePage(),
    ),
  ],
);
