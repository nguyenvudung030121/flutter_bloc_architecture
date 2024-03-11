import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocxx/src/presentation/pages/search/bloc/search_bloc.dart';
import 'package:flutter_blocxx/widgets/app_large_text.dart';

import '../../../../data/model/product/product.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
        listener: (BuildContext context, SearchState state) {},
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (BuildContext context, SearchState state) {
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: const AppLargeText(
                            text: 'Search',
                            alignment: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        state.product != null
                            ? Expanded(
                                child: _listProduct(context, state.product!, 1),
                              )
                            : Center(
                                child: AppLargeText(text: 'Null'),
                              ),
                      ],
                    )));
          },
        ));
  }

  Widget _listProduct(BuildContext context, Product product, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title != null ? product.title! : 'None',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description != null
                          ? product.description!
                          : 'None',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
