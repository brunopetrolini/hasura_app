import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final Function(Model) onChanged;
  final Model selectedItem;

  const CustomComboboxWidget({
    Key key,
    @required this.items,
    @required this.onChanged,
    @required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
      items: items,
      selectedItem: selectedItem,
      onChanged: (Model item) => onChanged(item),
      validate: (Model item) {
        if (item == null) {
          return "Item Requerido";
        } else {
          return null;
        }
      },
      dropdownBuilder: (context, model) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: model?.id == null
              ? ListTile(
                  title: Text(
                    "Selecione um item",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListTile(
                  title: Text(
                    model.description,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
        );
      },
    );
  }
}

class Model {
  final String id;
  final String description;

  Model(this.id, this.description);

  @override
  String toString() => description.toString();

  @override
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
