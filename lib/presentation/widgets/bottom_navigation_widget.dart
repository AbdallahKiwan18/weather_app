import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int? index;
  final void Function(int)? onTap;

  const BottomNavigationBarWidget({
    super.key,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: index!,
        //New
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_rounded),
            label: 'Next Five Days',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
