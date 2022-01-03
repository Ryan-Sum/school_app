import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Mon 1/3'),
                  subtitle: Column(
                    children: const [
                      Text('Cheese or Peperoni Pizza'),
                      Text('Fresh Garden Salad'),
                      Text('Assorted Fruits and Vegtables'),
                      Text('Assorted Chips, Soft Drinks, and Sweets')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Tue 1/4'),
                    subtitle: Column(
                      children: const [
                        Text('Beef Tacos'),
                        Text('Nachos with Ground Beef'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Wed 1/5'),
                    subtitle: Column(
                      children: const [
                        Text('Grilled Cheese'),
                        Text('Hot Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Thu 1/6'),
                    subtitle: Column(
                      children: const [
                        Text('Chicken Quesadilla'),
                        Text('Mini Queso Bites'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Fri 1/7'),
                    subtitle: Column(
                      children: const [
                        Text('Grilled Cheese'),
                        Text('Hot Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Swipe Right',
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Mon 1/10'),
                  subtitle: Column(
                    children: const [
                      Text('Spaghetti with Meatballs'),
                      Text('Cheese Calzones'),
                      Text('Assorted Fruits and Vegtables'),
                      Text('Assorted Chips, Soft Drinks, and Sweets')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Tue 1/11'),
                    subtitle: Column(
                      children: const [
                        Text('Brunch Bowl'),
                        Text('Breakfast Wrap'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Wed 1/12'),
                    subtitle: Column(
                      children: const [
                        Text('Chicken with Yellow Rice'),
                        Text('Chicken Fingers'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Thu 1/13'),
                    subtitle: Column(
                      children: const [
                        Text('Mini Chicken Bites'),
                        Text('Corn Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Fri 1/14'),
                    subtitle: Column(
                      children: const [
                        Text('Pulled Pork Sandwich'),
                        Text('Cheese Burger'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 16.0,
                    ),
                    Text(
                      '  Swipe Left or Right  ',
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Mon 1/17'),
                  subtitle: Column(
                    children: const [
                      Text('Cheese or Peperoni Pizza'),
                      Text('Fresh Garden Salad'),
                      Text('Assorted Fruits and Vegtables'),
                      Text('Assorted Chips, Soft Drinks, and Sweets')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Tue 1/18'),
                    subtitle: Column(
                      children: const [
                        Text('Beef Tacos'),
                        Text('Nachos with Ground Beef'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Wed 1/19'),
                    subtitle: Column(
                      children: const [
                        Text('Grilled Cheese'),
                        Text('Hot Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Thu 1/20'),
                    subtitle: Column(
                      children: const [
                        Text('Chicken Quesadilla'),
                        Text('Mini Queso Bites'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Fri 1/21'),
                    subtitle: Column(
                      children: const [
                        Text('Grilled Cheese'),
                        Text('Hot Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 16.0,
                    ),
                    Text(
                      '  Swipe Left or Right  ',
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Mon 1/24'),
                  subtitle: Column(
                    children: const [
                      Text('Spaghetti with Meatballs'),
                      Text('Cheese Calzones'),
                      Text('Assorted Fruits and Vegtables'),
                      Text('Assorted Chips, Soft Drinks, and Sweets')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Tue 1/25'),
                    subtitle: Column(
                      children: const [
                        Text('Brunch Bowl'),
                        Text('Breakfast Wrap'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Wed 1/26'),
                    subtitle: Column(
                      children: const [
                        Text('Chicken with Yellow Rice'),
                        Text('Chicken Fingers'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Thu 1/27'),
                    subtitle: Column(
                      children: const [
                        Text('Mini Chicken Bites'),
                        Text('Corn Dog'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  child: ListTile(
                    title: const Text('Fri 1/28'),
                    subtitle: Column(
                      children: const [
                        Text('Pulled Pork Sandwich'),
                        Text('Cheese Burger'),
                        Text('Assorted Fruits and Vegtables'),
                        Text('Assorted Chips, Soft Drinks, and Sweets')
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 16.0,
                    ),
                    Text(
                      '  Swipe Left or Right  ',
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Mon 1/31'),
                  subtitle: Column(
                    children: const [
                      Text('Cheese or Peperoni Pizza'),
                      Text('Fresh Garden Salad'),
                      Text('Assorted Fruits and Vegtables'),
                      Text('Assorted Chips, Soft Drinks, and Sweets')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 16.0,
                    ),
                    Text(
                      '  Swipe Left',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
