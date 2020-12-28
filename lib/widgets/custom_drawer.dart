import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:virtual_store/models/user_model.dart';
import 'package:virtual_store/tiles/drawer_tile.dart';
import 'package:virtual_store/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerback() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue[400], Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerback(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn()
                                      ? "Entre ou cadastre-se >"
                                      : "sair",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn()) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  } else {
                                    model.signOut();
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(Icons.shopping_bag, "Meus Pedidos", pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}
