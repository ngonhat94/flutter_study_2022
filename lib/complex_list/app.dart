import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoc_flutter/complex_list/repository.dart';
import 'package:hoc_flutter/complex_list/views/complex_list_page.dart';

class App extends MaterialApp {
  App({super.key, required Repository repository}) : super(home: 
    RepositoryProvider.value(value: repository, child: const ComplexListPage())
  );
}