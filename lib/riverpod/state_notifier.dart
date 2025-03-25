import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/model/shopping_item_model.dart';

// StateNotifier는 StateNotifier 안에 제공이될 클래스가 상속하는거고 StateNotifierProvider는 그 값을 상속한 클래스를 Provider로 만들 수 있는 것이다.
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);
// StateNotifierProvider<어떤 StateNotifier를 상속한 클래스를 쓸건지, 그 상태의 타입이 뭔지>(
// (ref) => ShoppingListNotifier(), -> 관리할 클래스를 인스턴스로 만들어주는거!!
// );

// ShoppingListNotifier는 StateNotifier를 상속받았고 그 안에 있는 기능을 그대로 이어받는다.
// StateNotifier는 반환값(List<ShoppingItemModel>)을 그대로 super constructor에 넣게 되어있는데 그 값이 state로 들어가게 된다. 우리가 관리할 상태가 그거다!

/// StateNotifier를 쓰려면 class를 만들고 StateNotifier를 상속받아야 한다.
/// 그리고 상태관리할 타입이 어떤 타입인지를 지정해서 <> 안에 넣어줘야 한다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        ); // 처음에 어떤 값으로 상태를 초기화할지를 넣어줘야 한다! super([]); -> 이렇게 빈 값으로 해줘도 됨!!

  void toggleHasBought({required String name}) {
    // 뭘 할거냐면 name과 일치하는 이름이 들어오면 hasBought를 반대로 바꿔주는 것을 할거다.
    // 위에 초기화된 저 값들을 불러오고 싶으면 state라고 하면 불러와진다.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e) // 이름이 다르면 그냥 그대로 반환해준다
        .toList();
  }
}
