import 'package:get_it/get_it.dart';
import 'package:shopping_cart_flutter/src/data/products/product_in_memory_repository.dart';
import 'package:shopping_cart_flutter/src/domain/products/get_products_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/product_repository.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_presenter.dart';

final getIt = GetIt.instance;

void init() {
  registerProductDependencies();
}

void registerProductDependencies() {
  getIt.registerFactory(() => ProductsPresenter(getIt()));

  getIt.registerLazySingleton(() => GetProductsUseCase(getIt()));

  getIt.registerLazySingleton<ProductRepository>(() => ProductInMemoryRepository());
}
