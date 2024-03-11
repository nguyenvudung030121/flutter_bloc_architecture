import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocxx/src/presentation/pages/search/bloc/search_bloc.dart';
import 'package:flutter_blocxx/src/presentation/pages/search/page/search_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int productId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc()..add(GetProductEvent(productId)),
        child: SearchBody());
  }
}
