import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/blocs/products/product_bloc.dart';
import 'package:store_app/blocs/products/product_event.dart';
import 'package:store_app/blocs/products/product_state.dart';
import 'package:store_app/core/config/app_color.dart';
import 'package:store_app/core/config/app_typography.dart';
import 'package:store_app/core/const/asset_const.dart';
import 'package:store_app/core/extensions/double_extension.dart';
import 'package:store_app/core/util/app_util.dart';
import 'package:store_app/core/widgets/app_bar/app_bar.dart';
import 'package:store_app/core/widgets/loading/list_loading.dart';
import 'package:store_app/core/widgets/refresh/refresh_builder.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = "/product-list";
  final ScrollController ctrl;

  const ProductListScreen({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();
    return Scaffold(
      appBar: CustomAppBar.titled(title: "Product List", isBack: false),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) => AppUtil.bindingInstance(() {
          state.when(
            onError: (msg) => Fluttertoast.showToast(msg: msg),
          );
        }),
        builder: (context, state) {
          return RefreshBuilder(
            controller: ctrl,
            refresh: () => bloc.add(GetListProduct()),
            child: state.buildWhen(
              onLoading: const ListLoading(),
              onEmpty: Padding(
                padding: EdgeInsets.only(top: 50.fromHeightPct),
                child: Center(
                  child: Text(
                    "No data. Please pull to refresh data",
                    style: AppTypography.body14(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              onInit: GridView.builder(
                itemCount: bloc.list.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, pos) {
                  final data = bloc.list[pos];
                  if (pos == bloc.list.length-1) {
                    return state.buildWhen(
                      onPaginate: Center(
                        child: Text(
                          "Loading data...",
                          style: AppTypography.body14(color: Colors.grey),
                        ),
                      ),
                      onInit: 50.spaceHeight,
                    );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image.network(
                          data.images?.first ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (_,__,___) {
                            return Image.asset(
                              AssetConst.icClothes,
                              color: AppColor.blueOcean,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(16),
                              ),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "\$ ${data.price}",
                                style: AppTypography.action(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
