import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sticky Header Sample',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const StickyScroll(),
    );
  }
}

/// A sample UI that behaves like the native iOS Reminders app, where each section
/// header remains fixed at the top of the screen while scrolling until the next
/// section header reaches the top.
///
/// Implemented easily using the flutter_sticky_header package.
///
/// https://pub.dev/packages/flutter_sticky_header
class StickyScroll extends StatelessWidget {
  const StickyScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sticky Header Sample')),
      body: const CustomScrollView(
        slivers: [
          _SliverSection(title: 'Section 1', color: Colors.red),
          _SliverSection(title: 'Section 2', color: Colors.green),
          _SliverSection(title: 'Section 3', color: Colors.blue),
        ],
      ),
    );
  }
}

class _SliverSection extends StatelessWidget {
  const _SliverSection({required this.title, required this.color});
  final String title;
  final Color color;

  static const double _headerHeight = 50;
  static const _childCount = 15;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: _headerHeight,
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            title: Text('Item $i'),
          ),
          childCount: _childCount,
        ),
      ),
    );
  }
}
