import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:go_router/go_router.dart';
import 'package:salita/src/drawer.dart';
import 'package:salita/strings.g.dart';
import 'package:salita/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings.dart';

class SettingsActivity extends StatefulWidget {
  const SettingsActivity({super.key});

  @override
  State<SettingsActivity> createState() => _SettingsActivityState();
}

class _SettingsActivityState extends State<SettingsActivity> {
  String? currentCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAdaptive(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          //if()
        ],
      ),
      body: SplitView.material(
        childWidth: 200,
        child: ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context2, index) {
            //get the current category
            final category = settings.entries.elementAt(index);
            final String categoryName =
                strings["settings.${category.key.id}.title"] ?? category.key.id;

            if (!category.key.isVisible) return Container();

            final currentSplitview = SplitView.of(context2);

            return ListTile(
              style: currentSplitview.isSecondaryVisible
                  ? ListTileStyle.drawer
                  : ListTileStyle.list,
              dense: currentSplitview.isSecondaryVisible,
              title: Text(categoryName),
              leading: Icon(category.key.icon),
              selected: currentCategory == category.key.id,
              onTap: () async {
                setState(() {
                  currentCategory = category.key.id;
                });

                currentSplitview.setSecondary(
                  LayoutBuilder(builder: (context, constraints) {
                    return Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 1000, maxHeight: constraints.maxHeight),
                          child: _SettingsSecondary(
                            category: category,
                            categoryName: categoryName,
                          ),
                        ),
                      ],
                    );
                  }),
                );
                category.key.onTap();
              },
            );
          },
        ),
        //placeholder: Text('asdasd'),
      ),
    );
  }
}

class _SettingsSecondary extends StatefulWidget {
  const _SettingsSecondary({
    Key? key,
    required this.category,
    required this.categoryName,
  }) : super(key: key);

  final MapEntry<SettingCategory, List<SettingTile<dynamic>>> category;
  final String categoryName;

  @override
  State<_SettingsSecondary> createState() => _SettingsSecondaryState();
}

class _SettingsSecondaryState extends State<_SettingsSecondary> {
  @override
  Widget build(BuildContext context) {
    final bool isAdvancedEnabled = getSettings('miscellaneous', 'advanced');

    return Container(
      child: ListView.builder(
        itemCount: widget.category.value.length + 1,
        itemBuilder: (context2, index) {
          if (index == 0 && !SplitView.of(context).isSecondaryVisible) {
            return ListTile(
              dense: true,
              leading: IconButton(
                onPressed: () {
                  SplitView.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_outlined),
              ),
              title: Text(widget.categoryName),
            );
          }
          if (index == 0) return Container();

          //get the current tile
          final tile = widget.category.value[index - 1];

          if (!tile.isVisible ||
              !tile.isEnabled ||
              (tile.isAdvanced && !isAdvancedEnabled)) return Container();

          final tileValue = tile.getValue();
          final String tileTitle = ((tile.isAdvanced) ? '🄰 ' : '') +
              (strings[
                      "settings.${widget.category.key.id}.tiles.${tile.id}.title"] ??
                  tile.id);
          final String? tileSubtitle = strings[
              'settings.${widget.category.key.id}.tiles.${tile.id}.subtitle'];

          //THE DIFFERENT SETTING TYPES
          switch (tile.defaultval.runtimeType) {
            case Null:
              if (tile.onTap == null) {
                return Container(
                  constraints: BoxConstraints(minHeight: 40),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    (strings["settings.${widget.category.key.id}.tiles.${tile.id}"] ??
                            tile.id)
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                );
              } else {
                return ListTile(
                  title: Text(tileTitle),
                  subtitle: (tileSubtitle == null) ? null : Text(tileSubtitle),
                  onTap: () {
                    tile.onTap!();
                    setState(() {});
                  },
                );
              }
            case String:
              return Container(
                constraints: const BoxConstraints(minHeight: 40),
                //padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      //flex: 4,
                      child: ListTile(
                        title: Text(tileTitle),
                        subtitle:
                            (tileSubtitle == null) ? null : Text(tileSubtitle),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: tileValue,
                        items: tile.options!
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(strings[
                                            "settings.${widget.category.key.id}.tiles.${tile.id}.options.$e"] ??
                                        e),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) async {
                          await tile.setValue(value);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              );
            case List<String>:
              return ListTile(
                title: Text(tileTitle),
                subtitle: (tileSubtitle == null) ? null : Text(tileSubtitle),
                onTap: tile.onTap,
              );
            case bool:
              return ListTile(
                title: Text(tileTitle),
                subtitle: (tileSubtitle == null) ? null : Text(tileSubtitle),
                trailing: Switch(
                  value: tileValue,
                  onChanged: (value) async {
                    await tile.setValue(value);
                    setState(() {});
                    //tile.onTap();
                  },
                ),
              );
            case int:
              return Container(
                constraints: BoxConstraints(minHeight: 40),
                //padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      //flex: 4,
                      child: ListTile(
                        title: Text(tileTitle),
                        subtitle:
                            (tileSubtitle == null) ? null : Text(tileSubtitle),
                      ),
                    ),
                    Text(tileValue.toString()),
                    Slider(
                      value: tileValue.toDouble(),
                      min: tile.options!.first.toDouble(),
                      max: tile.options!.last.toDouble(),
                      label: tileValue.toString(),
                      onChanged: (value) async {
                        await tile.setValue(value.toInt());
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            case double:
              return Container(
                constraints: BoxConstraints(minHeight: 40),
                //padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      //flex: 4,
                      child: ListTile(
                        title: Text(tileTitle),
                        subtitle:
                            (tileSubtitle == null) ? null : Text(tileSubtitle),
                      ),
                    ),
                    Text(tileValue.toStringAsFixed(0)),
                    Slider(
                      value: tileValue,
                      min: tile.options!.first,
                      max: tile.options!.last,
                      label: (tileValue as double).toStringAsFixed(0),
                      onChanged: (value) async {
                        await tile.setValue(value);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            default:
              return ListTile(
                title: Text(tileTitle),
                onTap: tile.onTap,
              );
          }
        },
      ),
    );
  }
}
