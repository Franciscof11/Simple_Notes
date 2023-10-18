import 'package:go_router/go_router.dart';

import '../view/pages/home_page/home_page.dart';
import '../view/pages/note_page.dart/note_page.dart';

final routes = GoRouter(
  initialLocation: '/HomePage',
  routes: [
    GoRoute(
      path: '/HomePage',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/NotePage',
      builder: (context, state) => const NotePage(),
    ),
  ],
);
