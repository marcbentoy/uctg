import 'dart:math';

dynamic chooseRandomly(List<dynamic> list) {
  int index = Random().nextInt(list.length);
  return list[index];
}
