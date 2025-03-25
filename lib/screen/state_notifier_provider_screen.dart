import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/model/shopping_item_model.dart';
import 'package:myriverpod/riverpod/state_notifier.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                  value: e.hasBought,
                  title: Text(e.name),
                  onChanged: (value) {
                    ref.read(shoppingListProvider.notifier).toggleHasBought(
                          name: e.name,
                        );
                  }),
            )
            .toList(),
      ),
    );
  }
}
