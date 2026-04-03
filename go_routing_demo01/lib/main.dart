import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed("details"),
          child: Text('Go to details!'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: const Center(child: Text("This is the details screen!")),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String id;
  final String filter;
  const ProductDetailsScreen({
    super.key,
    required this.id,
    required this.filter,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product $id")),
      body: Center(child: Text("Showing product $id\nFilter: $filter")),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(path: "/", name: "home", builder: (_, _) => const HomeScreen()),
    GoRoute(
      path: "/details",
      name: "details",
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "go_router demo",
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
