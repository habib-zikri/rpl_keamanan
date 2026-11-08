import 'package:flutter/material.dart';

import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../services/api_service.dart';

class DependencyInjector extends InheritedWidget {
  final ApiService apiService;
  final UserRepository userRepository;
  final PostRepository postRepository;

  DependencyInjector({
    super.key,
    required super.child,
  })  : apiService = ApiService(), // Menggunakan singleton instance
        userRepository = UserRepositoryImpl(apiService: ApiService()),
        postRepository = PostRepositoryImpl(apiService: ApiService());

  /// Method statis untuk memanggil injektor dari widget tree
  static DependencyInjector of(BuildContext context) {
    final DependencyInjector? result =
        context.dependOnInheritedWidgetOfExactType<DependencyInjector>();
    assert(result != null, 'DependencyInjector tidak ditemukan di context');
    return result!;
  }

  @override
  bool updateShouldNotify(DependencyInjector oldWidget) => false;
}