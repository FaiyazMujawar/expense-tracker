import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import '../theme.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final List<CustomBottomNavigationBarItem> navItems;
  final Function onChange;

  const CustomBottomNavigationBar({
    Key key,
    this.selectedIndex = 0,
    @required this.onChange,
    @required this.navItems,
  }) : super(key: key);
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
    assert(widget.navItems.length > 1);
    assert(widget.onChange != null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.navItems.map(
          (item) {
            int index = widget.navItems.indexOf(item);
            return GestureDetector(
              onTap: () {
                widget.onChange(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: 30,
                        color: widget.selectedIndex == index
                            ? item.color
                            : Colors.grey.shade800,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.selectedIndex == index
                              ? item.color
                              : Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const CustomBottomNavigationBarItem({
    Key key,
    this.icon,
    this.title,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
