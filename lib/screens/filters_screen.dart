import 'package:daily_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool  _gultenFree = false;
  bool  _vegetarian = false;
  bool  _vegan = false;
  bool  _lactoseFree = false;


  @override
  initState() {
    _gultenFree = widget.currentFilters['gluten']  == true;
    _lactoseFree = widget.currentFilters['lactose']  == true;
    _vegetarian = widget.currentFilters['vegetarian']  == true;
    _vegan = widget.currentFilters['vegan']  == true;
    super.initState();
  }


  Widget _buildSwitchTiles(
      String title, String subTitle, bool currentValue, dynamic updateValue) {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _gultenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
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
                _buildSwitchTiles('Gluten-free',
                    'Only include gluten-free meal.', _gultenFree, (newValue) {
                  setState(() {
                    _gultenFree = newValue;
                  });
                }),
                _buildSwitchTiles(
                    'Lactose-free',
                    'Only include lactose-free meal.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTiles(
                    'Vegetarian', 'Only include vegetarian meal.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTiles(
                    'Vegan-free', 'Only include vegan meal.', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
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
