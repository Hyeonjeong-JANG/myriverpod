import 'package:flutter_riverpod/flutter_riverpod.dart';

// famaly modifier은 프로바이더를 생성할 때 어떤 변수를 입력해서 프로바이더 안의 로직을 변경할 때 사용한다.
// family를 넣으면 두 번째 파라미터를 넣게 된다. 그리고 그 두 번째 파라미터를 어떤 값으로 받을지 제네릭에 적어 둔다.
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
