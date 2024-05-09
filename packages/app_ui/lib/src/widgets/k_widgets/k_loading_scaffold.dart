import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KLoadingScaffold extends HookConsumerWidget {
  const KLoadingScaffold({
    required this.loading,
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool loading;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: loading ? null : appBar,
      body: loading ? const SizedBox.expand() : body,
      bottomNavigationBar: loading ? null : bottomNavigationBar,
    );
  }
}
