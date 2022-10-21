import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hoc_flutter/complex_list/models/item.dart';
import 'package:hoc_flutter/complex_list/repository.dart';

part 'complex_list_state.dart';

class ComplexListCubit extends Cubit<ComplexListState> {
  ComplexListCubit({required this.repository}) : super(const ComplexListState.loading());

  final Repository repository;

  Future<void> fetchList() async {
    try {
      final items = await repository.fetchItems();
      emit(ComplexListState.success(items));
    } on Exception {
      emit(const ComplexListState.failure());
    }
  } 
}
