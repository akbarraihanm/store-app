import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/products/product_bloc.dart';
import 'package:store_app/blocs/products/product_event.dart';
import 'package:store_app/di/app_locator.dart';
import 'package:store_app/presentation/products/list/product_list_screen.dart';
import 'package:store_app/presentation/splash/splash_screen.dart';

class RouteGenerator {
  static Route generate(RouteSettings settings) {
    final route = settings.name;
    late Widget child;

    switch (route) {
      case ProductListScreen.routeName: {
        final ctrl = ScrollController();
        child = BlocProvider(
          create: (_) {
            final bloc = ProductBloc(sl());
            ctrl.addListener(() {
              if (ctrl.position.maxScrollExtent == ctrl.offset
                  && bloc.canPaginate) {
                bloc.add(PaginateListProduct());
              }
            });
            bloc.add(GetListProduct());
            return bloc;
          },
          child: ProductListScreen(ctrl: ctrl),
        );
      }
      default: {
        child = const SplashScreen();
      }
    }

    return MaterialPageRoute(builder: (_) => child);
  }
}