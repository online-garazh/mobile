import 'package:flutter/material.dart';
import 'package:mobile/components/custom_app_bar.dart';
import 'package:mobile/components/custom_section.dart';
import 'package:mobile/components/custom_icon_button.dart';
import 'package:mobile/components/custom_list_tile.dart';
import 'package:mobile/theme/default_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Меню',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.white70,
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.search,
            color: Colors.black,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.add,
            color: Colors.black,
          ),
        ],
      ),
      body: const _MenuView(),
    );
  }
}

class _MenuView extends StatelessWidget {
  const _MenuView();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.grey100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomListTile.doubleLineTitle(
              header: 'Serega0879',
              title: 'Serega',
              onPressed: () {},
              leading: Image.asset(
                'assets/images/rick.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            CustomSection(
              withDividers: true,
              sectionTitle: 'ZALUPA',
              children: [
                CustomListTile(
                  title: 'Придбати авто на дромі',
                  onPressed: () {},
                  leading: Image.asset(
                    'assets/images/COLT.jpeg',
                    fit: BoxFit.cover,
                  ),
                  hasNotification: true,
                ),
                CustomListTile(
                  title: 'Лента',
                  onPressed: () {},
                  leading: const Icon(Icons.garage_outlined),
                  newMessages: 12,
                ),
                CustomListTile(
                  title: 'Автомобілі',
                  onPressed: () {},
                  leading: Image.asset(
                    'assets/images/rick.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                CustomListTile(
                  title: 'Бортжурнали',
                  onPressed: () {},
                  leading: const Icon(Icons.menu_book),
                  hasNotification: true,
                ),
                CustomListTile(
                  title: 'Спільноти',
                  onPressed: () {},
                  leading: const Icon(Icons.people_alt_outlined),
                ),
                CustomListTile(
                  title: 'Автосервіси і магазини',
                  onPressed: () {},
                  leading: const Icon(Icons.car_repair),
                ),
                CustomListTile(
                  title: 'Барахолка',
                  onPressed: () {},
                  leading: const Icon(Icons.store_outlined),
                ),
                CustomListTile(
                  title: 'Вибір Авто дня',
                  onPressed: () {},
                  leading: const Icon(Icons.align_horizontal_left_sharp),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSection(
              sectionTitle: 'Щось ще',
              children: [
                CustomListTile(
                  title: 'Спільноти',
                  onPressed: () {},
                  leading: const Icon(Icons.abc),
                ),
                CustomListTile(
                  title: 'Автосервіси і магазини',
                  onPressed: () {},
                  leading: const Icon(Icons.abc),
                ),
                CustomListTile(
                  title: 'Барахолка',
                  onPressed: () {},
                  leading: const Icon(Icons.abc),
                ),
                CustomListTile(
                  title: 'Вибори авто для',
                  onPressed: () {},
                  leading: const Icon(Icons.abc),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
