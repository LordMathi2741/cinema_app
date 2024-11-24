import 'package:provider/provider.dart';
import 'package:cinema/shared/presentation/provider/ui_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../uses_cases/screens.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.watch<UiProvider>();
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
        onTap: (index){
            uiProvider.onNavigateRoute(index);
             Navigator.push(context, MaterialPageRoute(builder: (_) => screens[uiProvider.currentIndex]));
        },
        currentIndex: uiProvider.currentIndex,
        items: const [
           BottomNavigationBarItem(
               icon: Icon(Icons.home),
               label: "Home"
           ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            label: "Favorite"
          ),
        ]
    );
  }
}
