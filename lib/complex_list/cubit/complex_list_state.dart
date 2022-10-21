part of 'complex_list_cubit.dart';

enum ListStatus { loading, success, failure }

class ComplexListState extends Equatable {
  const ComplexListState({
    this.status = ListStatus.loading,
    this.items = const <Item>[]
  });

  const ComplexListState.loading() : this();
  const ComplexListState.success(List<Item> items) : this(status: ListStatus.success, items: items);
  const ComplexListState.failure() : this(status: ListStatus.failure);

  final ListStatus status;
  final List<Item> items;

  @override
  List<Object> get props => [];
}
