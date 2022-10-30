import 'dart:math';

import 'package:currency_calculator/bloc/app_cubit.dart';
import 'package:currency_calculator/bloc/currency_selection_cubit.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CurrencySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencySelectionCubit, CurrencySelectionState>(
      builder: (context, state) {
        if (!state.initialized) {
          return Center(child: CircularProgressIndicator(),);
        }

        return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            sliver: SliverAppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              leadingWidth: 0,
              floating: true,
              title: SizedBox(
                height: 50,
                child: TextField(
                  controller: CurrencySelectionCubit.of(context).controller,
                  onChanged: CurrencySelectionCubit.of(context).search,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      prefixIcon: const Icon(Icons.search),
                      hintText: FlutterI18n.translate(context, "searchHint"),
                      suffixIcon: state.showClear!
                          ? IconButton(
                              onPressed: () {
                                CurrencySelectionCubit.of(context).clearSearch();
                              },
                              icon: const Icon(Icons.clear))
                          : null),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            Currency currency = state.currencies![index];
          
            return ListTile(
              onTap: () {
                Navigator.pop(context, currency);
              },
              leading: Flag.fromString(
                currency.flagCode,
                width: 80,
                borderRadius: 8,
              ),
              title:
                  Text(FlutterI18n.translate(context, "currency.${currency.id}")),
              subtitle: Text(currency.countryIds.map((e) => FlutterI18n.translate(context, "country.$e")).join(", ")),
            );
          }, childCount: state.currencies!.length))
        ],
      );
      },
    );
  }
}
