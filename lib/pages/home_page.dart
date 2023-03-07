import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lexus_control_app/widgets/button_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      extendBody: true,
      body: _Body(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          iconSize: 40,
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            iconSize: 40,
          )
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LEXUS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexus',
                  ),
                ),
                Text(
                  'RC350 F Sport',
                  style: GoogleFonts.ptSans(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Image.asset('assets/lexus_rc350.png'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Controls',
              style: GoogleFonts.ptSans(
                fontSize: 45,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonCard(title: 'Engine'),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonCard(title: 'Doors'),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonCard(title: 'Trunk'),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonCard(title: 'Climate'),
                  ],
                ),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 229, 229, 230),
                Color.fromARGB(255, 246, 247, 247)
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                blurRadius: 30,
                offset: Offset(5, 5),
                color: Color.fromARGB(255, 210, 222, 245),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                index: 0,
                icon: CupertinoIcons.car_detailed,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 0),
              ),
              _NavBarItem(
                index: 1,
                icon: CupertinoIcons.location_fill,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    Key? key,
    required this.icon,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final int index;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 40,
            color: isSelected ? Colors.blue[600] : null,
          ),
        ],
      ),
    );
  }
}
