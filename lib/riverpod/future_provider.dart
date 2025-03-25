import 'package:flutter_riverpod/flutter_riverpod.dart';

// FutureProvider는 로딩되고나면 뒤로 갔다가 다시 돌아왔을 때 FutureBuilder와는 다르게 캐싱이 되어서 다시 로딩되지 않는다.
final multipleFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    Duration(
      seconds: 2,
    ),
  );

  // throw Exception('에럼당'); // 에러로 가는지 테스트하기 위한 용도

  return [1, 2, 3, 4, 5];
});
