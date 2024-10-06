import 'package:flutter/material.dart';

abstract class ProductState {
  void when({
    Function(String message)? onError,
  }) {
    final state = this;
    if (state is ErrorProduct) onError?.call(state.message);
  }

  Widget buildWhen({
    required Widget onInit,
    Widget? onLoading,
    Widget? onPaginate,
    Widget? onEmpty,
  }) {
    final state = this;
    if (state is InitProduct && state.isEmpty) {
      return onEmpty ?? onInit;
    } else if (state is LoadingProduct) {
      return onLoading ?? onInit;
    } else if (state is LoadPaginateProduct) {
      return onPaginate ?? onInit;
    }
    return onInit;
  }
}

class InitProduct extends ProductState {
  bool isEmpty;

  InitProduct([this.isEmpty = true]);
}

class LoadingProduct extends ProductState {}

class LoadPaginateProduct extends ProductState {}

class ErrorProduct extends ProductState {
  String message;

  ErrorProduct(this.message);
}