const _delay = Duration(microseconds: 800);
const _catalog = [
  'Code Smell1',
  'Code Smell2',
  'Code Smell3',
  'Code Smell4',
  'Code Smell5',
  'Code Smell6',
  'Code Smell7',
  'Code Smell8',
  'Code Smell9',
  'Bit Shift',
  'Code Smell11',
];

class ShoppingRepository {
  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);
}
