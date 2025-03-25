import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider =
    StateProvider<int>((ref) => 0); // 제네릭에는 어떤 타입의 값을 관리할지를 적어주고, => 뒤에는 관리하고 싶은 값을 반환을 해주면 된다.
