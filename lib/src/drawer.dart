import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:salita/strings.g.dart';
import 'package:salita/utils/extensions.dart';
import '../../src/data/entry.dart';
import '../settings.dart';
import '/opensource/adaptive.dart';
import 'data/wiktionary.dart';

import '/utils/functions.dart';
import 'definition/definition_search.dart';

class ScaffoldAdaptive extends StatefulWidget {
  const ScaffoldAdaptive({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.title,
  });
  final AppBar? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  final String? title;

  @override
  State createState() => _ScaffoldAdaptiveState();
}

class _ScaffoldAdaptiveState extends State<ScaffoldAdaptive> {
  late final ScrollController drawerScrollController;
  final key = ValueKey('s');

  @override
  void initState() {
    super.initState();
    drawerScrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    drawerScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // setApplicationMenu([
    //   NativeSubmenu(
    //     label: 'File',
    //     children: [
    //       NativeMenuItem(
    //         label: 'label',
    //         onSelected: (){showSearch(
    //     context: context,
    //     delegate: DefinitionSearchDelegate(),
    //   );},
    //       )
    //     ],
    //   ),
    // ]);
//
    final appBar = widget.appBar;
    final title =
        (widget.title == null) ? 'Salita' : "${widget.title} - Salita";

    if (isPlatformDesktop()) appWindow.title = title;

    return Scaffold(
      key: widget.key,
      appBar: appBar == null // || isPlatformDesktop()
          ? null
          : PreferredSizeWidgetAny(
              size: Size.fromHeight(isPlatformDesktop() ? 35 : kToolbarHeight),
              child: parentOrChild(
                condition: isPlatformDesktop(),
                child: AppBar(
                  key: appBar.key,
                  leading: isPlatformDesktop()
                      ? Icon(
                          // Logo of Salita
                          const IconData(0x1710,
                              fontFamily: 'NotoSansTagalog-Regular'),
                          //color: Colors.blue.shade300,
                          color: Colors.purpleAccent,
                          shadows: [
                            Shadow(
                              color: Theme.of(context).iconTheme.color!,
                              blurRadius: 16,
                            )
                          ],
                        )
                      : appBar.leading,
                  automaticallyImplyLeading: appBar.automaticallyImplyLeading,
                  title: isPlatformDesktop()
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.caption!,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : appBar.title,
                  actions: [
                    ...?appBar.actions,
                    if (!kIsWeb && isPlatformDesktop() && !Platform.isMacOS)
                      const VerticalDivider(
                        indent: 8,
                        endIndent: 8,
                      ),
                    if (!kIsWeb && isPlatformDesktop() && !Platform.isMacOS)
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          appWindow.minimize();
                        },
                        splashRadius: 16,
                        icon: const Icon(MdiIcons.windowMinimize),
                      ),
                    if (!kIsWeb && isPlatformDesktop() && !Platform.isMacOS)
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          appWindow.maximizeOrRestore();
                        },
                        splashRadius: 16,
                        icon: Icon(appWindow.isMaximized
                            ? MdiIcons.windowRestore
                            : MdiIcons.windowMaximize),
                      ),
                    if (!kIsWeb && isPlatformDesktop() && !Platform.isMacOS)
                      IconButton(
                        color: Colors.grey,
                        hoverColor: Colors.red,
                        onPressed: () {
                          appWindow.close();
                        },
                        splashRadius: 16,
                        icon: const Icon(MdiIcons.windowClose),
                      ),
                  ],
                  flexibleSpace: appBar.flexibleSpace,
                  bottom: appBar.bottom,
                  elevation: Theme.of(context).brightness == Brightness.dark
                      ? appBar.elevation
                      : 0,
                  scrolledUnderElevation: appBar.scrolledUnderElevation,
                  shadowColor: appBar.shadowColor,
                  surfaceTintColor: appBar.surfaceTintColor,
                  shape: appBar.shape,
                  backgroundColor: isPlatformDesktop()
                      ? ElevationOverlay.applyOverlay(
                          context, Theme.of(context).colorScheme.surface, 8)
                      : appBar.backgroundColor,
                  foregroundColor: appBar.foregroundColor,
                  iconTheme: appBar.iconTheme,
                  actionsIconTheme: appBar.actionsIconTheme,
                  primary: appBar.primary,
                  centerTitle: appBar.centerTitle,
                  excludeHeaderSemantics: appBar.excludeHeaderSemantics,
                  titleSpacing: appBar.titleSpacing,
                  toolbarOpacity: appBar.toolbarOpacity,
                  bottomOpacity: appBar.bottomOpacity,
                  toolbarHeight: isPlatformDesktop() ? 35 : kToolbarHeight,
                  leadingWidth: appBar.leadingWidth,
                  toolbarTextStyle: appBar.toolbarTextStyle,
                  titleTextStyle: appBar.titleTextStyle,
                  systemOverlayStyle: appBar.systemOverlayStyle,
                ),
                parent: (child) => GestureDetector(
                    onVerticalDragStart: (details) {
                      appWindow.startDragging();
                    },
                    onHorizontalDragStart: (details) {
                      appWindow.startDragging();
                    },
                    onDoubleTap: () {
                      appWindow.maximizeOrRestore();
                    },
                    child: child),
              ),
            ),
      body: isPlatformDesktop()
          ? Row(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    controller: drawerScrollController,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: NavigationRail(
                          minWidth: 56,
                          elevation: 8,
                          extended: false,
                          onDestinationSelected: (index) {
                            destinations[index].onTap(context);
                          },
                          destinations: [
                            for (final destination in destinations)
                              NavigationRailDestination(
                                icon: Tooltip(
                                  message: destination.tooltip,
                                  child: Icon(destination.icon),
                                ),
                                label: Text(destination.name),
                              ),
                          ],
                          selectedIndex: null,
                          trailing: Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                onPressed: () {
                                  if (GoRouter.of(context).location !=
                                      '/settings') {
                                    GoRouter.of(context).go('/settings');
                                  }
                                },
                                color: Theme.of(context)
                                    .iconTheme
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.64))
                                    .color,
                                icon: Icon(Icons.settings_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                if (widget.body != null) Expanded(child: widget.body!),
              ],
            )
          : widget.body,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: isPlatformDesktop()
          ? null
          : Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      strings.general.app.title,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.white, fontFamily: 'Raleway'),
                    ),
                    accountEmail: Text('All-in-one dictionary'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.translate_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    title: Text('Definition language'),
                    subtitle: Text(
                      SourceWiktionary.fromSettings().name,
                    ),
                    onTap: () async {
                      var sortmode = 0;
                      final selected =
                          await showModalBottomSheetScaffold<String>(
                        context: context,
                        title: 'Select the language for definitions',
                        builder: (context, setState) {
                          final list = SourceWiktionary.map.entries.toList();
                          list.sort((a, b) {
                            switch (sortmode) {
                              // sorting by entry count descending
                              case 5:
                                return b.value.numberEntries
                                    .compareTo(a.value.numberEntries);
                              // sorting by entry count ascending
                              case 4:
                                return a.value.numberEntries
                                    .compareTo(b.value.numberEntries);
                              // sorting by name descending
                              case 3:
                                return b.key.compareTo(a.key);
                              // DEFAULT: sorting by name ascending
                              case 2:
                                return a.key.compareTo(b.key);
                              // sorting by name descending
                              case 1:
                                return b.value.name.compareTo(a.value.name);
                              // DEFAULT: sorting by name ascending
                              case 0:
                              default:
                                return a.value.name.compareTo(b.value.name);
                            }
                          });

                          final items = [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Sort by name A-Z'),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text('Sort by name Z-A'),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text('Sort by code A-Z'),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text('Sort by code Z-A'),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text('Sort by entry count 0-9'),
                            ),
                            PopupMenuItem(
                              value: 5,
                              child: Text('Sort by entry count 9-0'),
                            ),
                          ];

                          return [
                            PopupMenuButton<int>(
                              initialValue: sortmode,
                              tooltip: 'Sort by',
                              onSelected: (value) {
                                setState(() {
                                  sortmode = value;
                                });
                              },
                              itemBuilder: (context) => items,
                              child: ListTile(
                                leading: Icon(
                                  Icons.sort_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                title: items[sortmode].child,
                                trailing: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                            ),
                            const Divider(),
                            for (final i in list)
                              ListTile(
                                selected:
                                    getSettings('definition', 'language') ==
                                        i.key,
                                title: Text(i.value.name),
                                trailing:
                                    getSettings('definition', 'language') ==
                                            i.key
                                        ? const Icon(Icons.check_outlined)
                                        : null,
                                leading: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    border: Border.all(
                                        color:
                                            Theme.of(context).iconTheme.color!),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(i.key.toUpperCase()),
                                  ),
                                ),
                                subtitle:
                                    Text('${i.value.numberEntries}+ entries'),
                                onTap: () {
                                  Navigator.pop(context, i.key);
                                },
                              )
                          ];
                        },
                        actions: (context, setState) {
                          return [];
                        },
                      );
                      if (selected != null) {
                        setSettings('definition', 'language', selected);
                        // setstate to refresh displayed language name
                        setState(() {});
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: Text('Home'),
                    onTap: () {
                      if (GoRouter.of(context).location != '/') {
                        GoRouter.of(context).go('/');
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  //ListTile(
                  //  leading: const Icon(Icons.search_outlined),
                  //  title: Text('Search'),
                  //  onTap: () {
                  //    showSearch(
                  //        context: context,
                  //        delegate: DefinitionSearchDelegate());
                  //  },
                  //),
                  ListTile(
                    leading: const Icon(Icons.history_outlined),
                    title: Text('History'),
                    onTap: () {
                      Navigator.pop(context);
                      showUnsupportedSnackbar(context);
                      // showModalBottomSheetScaffold(
                      //   context: context,
                      //   builder: (context, setState) {
                      //     final history = SettingsKeys.appDefinitionHistory;
                      //     return [
                      //       ListView.builder(
                      //         itemCount: history.length,
                      //         itemBuilder: (context, index) {
                      //           return ListTile(
                      //             title: Text(history[index]),
                      //             onTap: () {
                      //               EntryLink.fromHref(history[index])
                      //                   .go(context, isOnline: true);
                      //             },
                      //           );
                      //         },
                      //       )
                      //     ];
                      //   },
                      //   isScrollable: true,
                      // );
                    },
                  ),
                  //ListTile(
                  //  leading: const Icon(Icons.bookmark_outline),
                  //  title: Text('Bookmarks'),
                  //  onTap: () {
                  //    Navigator.pop(context);
                  //    showUnsupportedSnackbar(context);
                  //  },
                  //),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      if (GoRouter.of(context).location != '/settings') {
                        GoRouter.of(context).go('/settings');
                      }
                      //showUnsupportedSnackbar(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text('About'),
                    onTap: () async {
                      Navigator.pop(context);
                      final packageInfo = await PackageInfo.fromPlatform();
                      showAboutDialog(
                        context: context,
                        applicationName: strings.general.app.title,
                        applicationLegalese: 'Made with ❤️ by Tudlang (Yivan)',
                        applicationVersion: packageInfo.version,
                      );
                    },
                  ),
                ],
              ),
            ),
      onDrawerChanged: widget.onDrawerChanged,
      endDrawer: widget.endDrawer,
      onEndDrawerChanged: widget.onEndDrawerChanged,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      restorationId: widget.restorationId,
    );
  }
}

class Destination {
  final String name;
  final IconData icon;
  final String tooltip;
  final String nameBar;
  final void Function(BuildContext context) onTap;

  const Destination({
    required this.name,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    String? nameBar,
  }) : nameBar = nameBar ?? name;
}

final destinations = <Destination>[
  Destination(
    name: 'Home',
    icon: Icons.home_outlined,
    tooltip: 'Homepage',
    onTap: (context) {
      GoRouter.of(context).go('/');
    },
  ),
  Destination(
    name: 'Definition language',
    icon: Icons.translate_outlined,
    tooltip: 'Definition language',
    onTap: (context) {
      showUnsupportedSnackbar(context);
    },
  ),
  Destination(
    name: 'History',
    icon: Icons.history_outlined,
    tooltip: 'History',
    onTap: (context) {
      showUnsupportedSnackbar(context);
    },
  ),
  //Destination(
  //  name: 'Bookmarks',
  //  icon: MdiIcons.bookmarkMultipleOutline,
  //  tooltip: 'Bookmarks',
  //  onTap: (context) {},
  //),
];

class PreferredSizeWidgetAny extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Size size;

  const PreferredSizeWidgetAny({
    super.key,
    required this.child,
    this.size = const Size.fromHeight(kToolbarHeight),
  });

  @override
  Widget build(BuildContext context) => child;

  @override
  Size get preferredSize => size;
}

/*ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    /* PopupMenuButton<int>(
                                      tooltip: '',
                                      position: PopupMenuPosition.under,
                                      child: Align(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'File',
                                            style: Theme.of(context).textTheme.caption,
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            height: 35,
                                            child: SizedBox(
                                              width: 280,
                                              child: ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0, vertical: -4),
                                                minVerticalPadding: 0,
                                                contentPadding: EdgeInsets.zero,
                                                minLeadingWidth: 0,
                                                iconColor:
                                                    Theme.of(context).iconTheme.color,
                                                dense: true,
                                                title: Text(
                                                  'sd',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button,
                                                ),
                                                trailing: Text(
                                                  'Ctrl+123',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                                leading: Icon(
                                                  Icons.abc,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: 35,
                                            padding: EdgeInsets.zero,
                                            child: SizedBox(
                                              width: 280,
                                              child: PopupMenuButton<int>(
                                                tooltip: "",
                                                position: PopupMenuPosition.over,
                                                offset: Offset(0, -10),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                                  child: ListTile(
                                                    visualDensity: VisualDensity(
                                                        horizontal: 0, vertical: -4),
                                                    minVerticalPadding: 0,
                                                    contentPadding: EdgeInsets.zero,
                                                    minLeadingWidth: 0,
                                                    iconColor: Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                    dense: true,
                                                    title: Text(
                                                      'Open new file',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button,
                                                    ),
                                                    trailing:
                                                        Icon(Icons.arrow_right_sharp),
                                                    leading: Icon(
                                                      Icons.abc,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                itemBuilder: (context) {
                                                  return [
                                                    PopupMenuItem(
                                                      height: 35,
                                                      child: ListTile(
                                                        visualDensity: VisualDensity(
                                                            horizontal: 0,
                                                            vertical: -4),
                                                        minVerticalPadding: 0,
                                                        contentPadding: EdgeInsets.zero,
                                                        minLeadingWidth: 0,
                                                        iconColor: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                        dense: true,
                                                        title: Text(
                                                          'sd',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .button,
                                                        ),
                                                        trailing: Text(
                                                          'Ctrl+123',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .caption,
                                                        ),
                                                        leading: Icon(
                                                          Icons.abc,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ];
                                                },
                                              ),
                                            ),
                                          ),
                                        ];
                                      },
                                    ),
                                   */
                                  ],
                                ),*/