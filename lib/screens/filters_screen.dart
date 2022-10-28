import 'package:daily_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gultenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchTiles(String title, String subTitle, bool currentValue,
      dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection!',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTiles(
                    'Gluten-free',
                    'Only include gluten-free meal.',
                    _gultenFree,
                        (newValue) {
                      setState(() {
                        _gultenFree = newValue;
                  });
                }),
                _buildSwitchTiles(
                    'Lactose-free',
                    'Only include lactose-free meal.',
                    _lactoseFree,
                        (newValue) {
                      setState(() {
                        _gultenFree = newValue;
                      });
                    }),
                _buildSwitchTiles(
                    'Vegetarian',
                    'Only include vegetarian meal.',
                    _vegetarian,
                        (newValue) {
                      setState(() {
                        _gultenFree = newValue;
                      });
                    }),
                _buildSwitchTiles(
                    'Vegan-free',
                    'Only include vegan meal.',
                    _vegan,
                        (newValue) {
                      setState(() {
                        _gultenFree = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
