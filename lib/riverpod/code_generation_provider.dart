import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// code generation를 사용하는 이유!
// 1) 어떤 Provider를 사용할지 고민할 필요가 없다!
// Provider, FutureProvider, StreamProvider가 제공되고
// StateNotifierProvider는 명시적으로 사용할 수가 있다.
// code generation을 사용하면 riverpod이 알아서 해준다!

// 원래는 프로바이더를 아래와 같이 선언했었는데 code generation을 사용하면 Provider 종류를 결정하지 않고 선언할 수 있다!
// final _testProvider = Provider<String>((ref) => 'Hello, Code Generation'); <--- 요랬는데...

@riverpod
String gState(GStateRef ref) {
  // 그냥 일반 함수를 선언해주면 되는데 반드시 매개변수를 다음과 같이 넣어줘야 한다! 그것은 (ref)값이다.
  return 'Hello Code Generation';
} // <-- 요래됐습니다!

// 2) Parameter(Family Modifier)를 일반 함수처럼 사용할 수 있게 해준다.
// 원래는 파라미터를 하나만 넣을 수 있었기 때문에 클래스를 만들어야 했는데 이제는 그럴 필요가 없다.
