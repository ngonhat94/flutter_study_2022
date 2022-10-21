import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoc_flutter/complex_list/cubit/complex_list_cubit.dart';
import 'package:hoc_flutter/complex_list/repository.dart';

import '../models/item.dart';

class ComplexListPage extends StatelessWidget {
  const ComplexListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex List')),
      body: BlocProvider(
        create: (_) => ComplexListCubit(repository: context.read<Repository>())..fetchList(),
        child: const ComplexListView(),
      ),
    );
  }
}

class ComplexListView extends StatelessWidget {
  const ComplexListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ComplexListCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'),);
        case ListStatus.loading:
        return const Center(child: CircularProgressIndicator(),);
        case ListStatus.success:
        return ItemView(items: state.items);
    }
  }
}

class ItemView extends StatelessWidget {
  const ItemView({super.key, required this.items});

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ItemTile(
                item: items[index],
                onDeletePressed: (id) {
                  print(id);
                },
              );
            },
            itemCount: items.length,
          );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.onDeletePressed,
  });

  final Item item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text('#${item.id}'),
        title: Text(item.value),
        trailing: item.isDeleting
            ? const CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDeletePressed(item.id),
              ),
      ),
    );
  }
}
