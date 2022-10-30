import 'package:currency_calculator/bloc/ads_cubit.dart';
import 'package:currency_calculator/bloc/app_cubit.dart';
import 'package:currency_calculator/bloc/currency_selection_cubit.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:currency_calculator/ui/widget/currency_selection.dart';
import 'package:currency_calculator/utils.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';

import '../../bloc/review_cubit.dart';

const int startupsBeforeReview = 10;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewCubit, int>(
      listener: (_, __) {
        try {
          InAppReview.instance.requestReview();
        } catch (_) {}
      },
      listenWhen: (previous, current) => current == startupsBeforeReview,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(context, "title"),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: AppCubit.of(context).refresh,
                  icon: Icon(Icons.refresh))
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(child: Placeholder()),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(FlutterI18n.translate(context, "like")),
                  onTap: openLikeUrl,
                ),
                ListTile(
                  leading: const Icon(Icons.workspace_premium),
                  title: Text(FlutterI18n.translate(context, "get_pro")),
                  onTap: openProVersionUrl,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: Text(FlutterI18n.translate(context, "contact")),
                  onTap: () => openContactInformation(context),
                ),
                ListTile(
                  leading: const Icon(Icons.gavel),
                  title: Text(FlutterI18n.translate(context, "terms")),
                  onTap: () => openTermsOfUse(context),
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: Text(FlutterI18n.translate(context, "privacy")),
                  onTap: () => openPrivacyPolicy(context),
                ),
              ],
            ),
          ),
          body: BlocListener<AppCubit, AppState>(
            listenWhen: (previous, current) => previous.error != current.error && current.error != null,
            listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.announcement, color: Colors.white,),
                  const SizedBox(width: 16,),
                  Text(FlutterI18n.translate(context, "error.${state.error}")),
                ],
              ))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child:
                  BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
                if (!appState.initialized)
                  return const Center(child: CircularProgressIndicator());
          
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _onChangeFromCurrency(context),
                          child: Flag.fromString(
                            appState.from!.flagCode,
                            height: 100,
                            width: 100,
                            flagSize: FlagSize.size_1x1,
                            borderRadius: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: IconButton(
                            iconSize: 40,
                            icon: const Icon(
                              Icons.swap_horiz,
                            ),
                            onPressed: AppCubit.of(context).switchCurrencies,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onChangeToCurrency(context),
                          child: Flag.fromString(
                            appState.to!.flagCode,
                            height: 100,
                            width: 100,
                            flagSize: FlagSize.size_1x1,
                            borderRadius: 80,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          onChanged: (_) =>
                              AppCubit.of(context).onFromValueChanged(),
                          controller: AppCubit.of(context).fromController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              hintText: appState.from!.id.toUpperCase(),
                              suffix: Text(appState.from!.symbol)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "≈",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (_) =>
                              AppCubit.of(context).onToValueChanged(),
                          controller: AppCubit.of(context).toController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: appState.to!.id.toUpperCase(),
                            suffix: Text(appState.to!.symbol),
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ))
                      ],
                    ),
                    Spacer(),
                    Text(
                      FlutterI18n.translate(context, "overview"),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      flex: 8,
                      child: SingleChildScrollView(
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: DataTable(
                              headingRowHeight: 35,
                              dataRowHeight: 35,
                              columns: [
                                DataColumn(
                                    label: Text(
                                  appState.from!.symbol,
                                )),
                                DataColumn(label: Text(appState.to!.symbol)),
                              ],
                              rows: [
                                for (double i in appState.from!.bills)
                                  DataRow(cells: [
                                    DataCell(Center(
                                        child: Text(i.toStringAsFixed(2)))),
                                    DataCell(Center(
                                        child: Text((i * appState.conversionRate!)
                                            .toStringAsFixed(2)))),
                                  ])
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "${FlutterI18n.translate(context, "refresh")} ${DateFormat.yMd("de").add_jm().format(appState.refreshDate!)}",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      )),
                    ),
                    BlocBuilder<AdsCubit, bool>(builder: ((context, adLoaded) {
                      return adLoaded
                          ? Center(
                              child: SizedBox(
                                  height: 50,
                                  width: 320,
                                  child: ads.AdWidget(
                                      ad: AdsCubit.of(context).banner!)),
                            )
                          : Container();
                    })),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _changeCurrency(BuildContext context, Function(Currency) callback) async {
    CurrencySelectionCubit.of(context).init(context);
    Currency? currency = await showModalBottomSheet<Currency>(
        context: context,
        isScrollControlled: true,
        builder: (_) => FractionallySizedBox(
            heightFactor: 0.7, child: CurrencySelection()));
    if (currency == null) return;
    callback(currency);
  }

  void _onChangeFromCurrency(BuildContext context) async {
    _changeCurrency(context, (currency) =>
    AppCubit.of(context).setFromCurrency(currency));
  }

  void _onChangeToCurrency(BuildContext context) {
    _changeCurrency(context, (currency) =>
    AppCubit.of(context).setToCurrency(currency));
  }
}
