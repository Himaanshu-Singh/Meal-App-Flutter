import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var __vegertarian = false;
  var _vegan = false;
  var _lactose = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactose = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    __vegertarian = widget.currentFilters['vegetarian']!;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vegan': _vegan,
                  'vegetarian': __vegertarian,
                };
                widget.saveFilters(selectedfilters);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian-Free',
                  'Only include Vegetarian-free meals',
                  __vegertarian,
                  (newValue) {
                    setState(
                      () {
                        __vegertarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan-Free',
                  'Only include Vegan-free meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include Lactose-free meals',
                  _lactose,
                  (newValue) {
                    setState(
                      () {
                        _lactose = newValue;
                      },
                    );
                  },
                ),
              ],
            )),
          ],
        ));
  }
}
