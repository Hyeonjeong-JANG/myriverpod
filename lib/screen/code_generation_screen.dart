import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider); // 우리가 만든 gState가 아니라 g.dart에 있는 gStateProvider를 사용한다.
    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('State1: $state1'),
        ],
      ),
    );
  }
}
