import 'package:flutter/material.dart';
import 'package:transaction_app/core/di/dependecy_injection.dart';
import 'dart:developer' as developer;
import 'presentation/pages/transaction_list_page.dart';

void main() async {
  try {
    developer.log('Starting Transaction App', name: 'Main');

    WidgetsFlutterBinding.ensureInitialized();

    // Configure dependencies
    await configureDependencies();
    developer.log('Dependencies configured successfully', name: 'Main');

    runApp(const TransactionApp());
  } catch (e, stackTrace) {
    developer.log(
      'Error starting app: $e',
      name: 'Main',
      error: e,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}

class TransactionApp extends StatelessWidget {
  const TransactionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.fixed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const TransactionListPage(),
      builder: (context, child) {
        // Global error handling wrapper
        return _AppErrorWrapper(child: child);
      },
    );
  }
}

class _AppErrorWrapper extends StatelessWidget {
  final Widget? child;

  const _AppErrorWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
