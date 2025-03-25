abstract class ProductEvent {}

class LoadProducts extends ProductEvent {
  final int page;
  final int limit;

  LoadProducts({this.page = 0, this.limit = 10});
}
