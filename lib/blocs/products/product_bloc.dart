import 'package:bloc/bloc.dart';
import 'package:store_app/blocs/products/product_event.dart';
import 'package:store_app/blocs/products/product_state.dart';
import 'package:store_app/core/master/models/query_data.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';
import 'package:store_app/domain/products/domain/use_case/get_list_product_use_case.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetListProductUseCase _getList;

  List<ProductEntity> _list = [];
  List<ProductEntity> get list => _list;

  int _offset = 0;
  bool canPaginate = true;

  ProductBloc(this._getList): super(LoadingProduct()) {
    on<GetListProduct>((event, emit) async {
      emit(LoadingProduct());
      _offset = 0;
      canPaginate = true;
      final result = await _getList(QueryData(offset: _offset));
      result.when(
        onError: (msg) => emit(ErrorProduct(msg)),
        onNetworkError: (msg) => emit(ErrorProduct(msg)),
        onSuccess: (data) {
          _list = data ?? [];
          emit(InitProduct(_list.isEmpty));
        },
      );
    });

    on<PaginateListProduct>((event, emit) async {
      emit(LoadPaginateProduct());
      _offset+=10;
      final result = await _getList(QueryData(offset: _offset));
      result.when(
        onError: (msg) => emit(ErrorProduct(msg)),
        onNetworkError: (msg) => emit(ErrorProduct(msg)),
        onSuccess: (data) {
          final d = data ?? [];
          _list.addAll(d);
          if (d.isEmpty) canPaginate = false;
          emit(InitProduct(_list.isEmpty));
        },
      );
    });
  }

}