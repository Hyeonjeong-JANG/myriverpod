import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpice() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
