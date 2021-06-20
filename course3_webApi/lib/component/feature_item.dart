import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String _title;
  final IconData _icon;
  final Function onTap;

  FeatureItem(this._title, this._icon, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 80,
            width: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  _icon,
                  color: Colors.black,
                  size: 38,
                ),
                Text(
                  _title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
