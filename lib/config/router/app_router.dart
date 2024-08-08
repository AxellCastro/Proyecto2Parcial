import 'package:go_router/go_router.dart';
import 'package:salad_start_app/domain/ensalada.dart';
import 'package:salad_start_app/presentation/authentication/authentication_screen.dart';
import 'package:salad_start_app/presentation/authentication/form_user_screen.dart';
import 'package:salad_start_app/presentation/modules/details/ensalada_detail_screen.dart';
import 'package:salad_start_app/presentation/modules/home/home_screen.dart';
import 'package:salad_start_app/presentation/modules/order/order_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AuthenticationScreen.name,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      path: '/form-user',
      name: FormUserScreen.name,
      builder: (context, state) => const FormUserScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/ensalada-detail',
      name: 'ensalada-detail',
      builder: (context, state) {
        final ensalada = state.extra as Ensalada;
        return EnsaladaDetailScreen(ensalada: ensalada);
      },
    ),
    GoRoute(
      path: '/order-screen',
      builder: (context, state) {
        final ensalada = state.extra as Ensalada;
        return OrderScreen(ensalada: ensalada);
      },
    ),
  ],
);
