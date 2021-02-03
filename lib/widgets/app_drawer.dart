import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../constants/route_names.dart';
import 'app_route_observer.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;
  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff2A3F54),
        child: Drawer(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xff2A3F54),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        //padding: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 130,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(
                                    "https://colorlib.com/polygon/gentelella/images/img.jpg",
                                    width: 56,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Stack(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text('Welcolme',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xffBAB8B8))),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 48,
                                          ),
                                          Text(
                                            'John Doe',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffECF0F1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff2A3F54),
                        ),
                      ),
                      ListTileTheme(
                        iconColor: Color(0xffE7E7E7),
                        child: ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text(
                            PageTitles.home,
                          ),
                          onTap: () async {
                            await _navigateTo(context, RouteNames.home);
                          },
                          selected: _selectedRoute == RouteNames.home,
                        ),
                      ),
                      ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.edit_road),
                            title: const Text(
                              PageTitles.forms,
                            ),
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.general_form);
                            },
                            selected: _selectedRoute == RouteNames.general_form,
                          )),
                      ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text(
                              PageTitles.gallery,
                            ),
                            onTap: () async {
                              await _navigateTo(context, RouteNames.gallery);
                            },
                            selected: _selectedRoute == RouteNames.gallery,
                          )),
                      ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.slideshow),
                            title: const Text(
                              PageTitles.slideshow,
                            ),
                            onTap: () async {
                              await _navigateTo(context, RouteNames.slideshow);
                            },
                            selected: _selectedRoute == RouteNames.slideshow,
                          )),
                      /*const Divider(
                    color: Color(0xffF5F6F5),
                  ),*/
                      ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.settings),
                            title: const Text(
                              PageTitles.settings,
                            ),
                            onTap: () async {
                              await _navigateTo(context, RouteNames.settings);
                            },
                            selected: _selectedRoute == RouteNames.settings,
                          )),
                      ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text(
                              "Salir del sistema",
                            ),
                            onTap: () async {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            //selected: _selectedRoute == RouteNames.settings,
                          )),
                    ],
                  ),
                ),
              ),
              if (widget.permanentlyDisplay)
                const VerticalDivider(
                  width: 1,
                )
            ],
          ),
        ));
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}
