import 'package:get_it/get_it.dart';
import 'package:transaction_app/data/database/all_app_database.dart';
import 'package:transaction_app/data/repositories/merchant_repository.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'package:transaction_app/domain/usecases/create_transactions_usecase.dart';
import 'dart:developer' as developer;
import '../../data/repositories/merchant_repository_impl.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/usecases/delete_transaction_usecase.dart';
import '../../domain/usecases/get_transaction_summary_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../domain/usecases/update_transaction_usecase.dart';
import '../../presentation/bloc/transaction_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  try {
    developer.log('Configuring dependencies', name: 'DependencyInjection');
    
    // Database
    getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
    
    // Repositories
    getIt.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(database: getIt<AppDatabase>()),
    );
    
    getIt.registerLazySingleton<MerchantRepository>(
      () => MerchantRepositoryImpl(database: getIt<AppDatabase>()),
    );
    
    // Use cases
    getIt.registerLazySingleton<GetTransactionsUseCase>(
      () => GetTransactionsUseCase(repository: getIt<TransactionRepository>()),
    );
    
    getIt.registerLazySingleton<GetTransactionsByDateRangeUseCase>(
      () => GetTransactionsByDateRangeUseCase(repository: getIt<TransactionRepository>()),
    );
    
    getIt.registerLazySingleton<CreateTransactionUseCase>(
      () => CreateTransactionUseCase(repository: getIt<TransactionRepository>()),
    );
    
    getIt.registerLazySingleton<UpdateTransactionUseCase>(
      () => UpdateTransactionUseCase(repository: getIt<TransactionRepository>()),
    );
    
    getIt.registerLazySingleton<DeleteTransactionUseCase>(
      () => DeleteTransactionUseCase(repository: getIt<TransactionRepository>()),
    );
    
    getIt.registerLazySingleton<GetTransactionSummaryUseCase>(
      () => GetTransactionSummaryUseCase(repository: getIt<TransactionRepository>()),
    );
    
    // Bloc
    getIt.registerFactory<TransactionBloc>(
      () => TransactionBloc(
        getTransactionsUseCase: getIt<GetTransactionsUseCase>(),
        getTransactionsByDateRangeUseCase: getIt<GetTransactionsByDateRangeUseCase>(),
        createTransactionUseCase: getIt<CreateTransactionUseCase>(),
        updateTransactionUseCase: getIt<UpdateTransactionUseCase>(),
        deleteTransactionUseCase: getIt<DeleteTransactionUseCase>(),
        getTransactionSummaryUseCase: getIt<GetTransactionSummaryUseCase>(),
      ),
    );
    
    developer.log('Dependencies configured successfully', name: 'DependencyInjection');
  } catch (e) {
    developer.log('Error configuring dependencies: $e', name: 'DependencyInjection');
    rethrow;
  }
}

Future<void> resetDependencies() async {
  try {
    developer.log('Resetting dependencies', name: 'DependencyInjection');
    await getIt.reset();
    developer.log('Dependencies reset successfully', name: 'DependencyInjection');
  } catch (e) {
    developer.log('Error resetting dependencies: $e', name: 'DependencyInjection');
    rethrow;
  }
}