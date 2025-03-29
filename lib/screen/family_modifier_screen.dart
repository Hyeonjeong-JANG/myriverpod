import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 원래는 ref.watch(familyModifierProvider)이렇게만 해도 되는데 family를 쓰면 데이터값이 해당하는 파라미터를 넣어줘야 한다.
    final state = ref.watch(familyModifierProvider(
        17)); // 여기의 3이 family_modifier_provider.dart 에서 두 번째 파라미터인 data로 받는 값이다.ac

    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
