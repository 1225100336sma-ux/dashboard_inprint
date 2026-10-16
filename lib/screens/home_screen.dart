import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';
import '../widgets/header_widget.dart';
import '../widgets/new_order_banner.dart';
import '../widgets/current_order_card.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista limpia de productos
  final List<ProductModel> products = const [
    ProductModel(
      title: 'Lonas',
      description:
          'Lonas publicitarias de alta durabilidad e impresión HD resistente a la intemperie.',
      icon: Icons.view_carousel_rounded,
      accentColor: AppColors.primaryPink,
      price: '\$150 / m²',
    ),
    ProductModel(
      title: 'Tarjetas',
      description:
          'Tarjetas de presentación personalizadas con acabados en mate, brillante o barniz registrado.',
      icon: Icons.badge_rounded,
      accentColor: AppColors.primaryBlue,
      price: '\$250 / 100 pzas',
    ),
    ProductModel(
      title: 'Invitaciones',
      description:
          'Invitaciones elegantes para eventos especiales, cumpleaños, bodas y graduaciones.',
      icon: Icons.mark_email_read_rounded,
      accentColor: AppColors.primaryYellow,
      price: '\$350 / 50 pzas',
    ),
    ProductModel(
      title: 'Flyers',
      description:
          'Volantes promocionales a color en papel couché de alta calidad.',
      icon: Icons.feed_rounded,
      accentColor: AppColors.primaryPink,
      price: '\$400 / 1000 pzas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(userName: 'Sofía'),
              const SizedBox(height: 20),
              NewOrderBanner(onTap: () {}),
              const SizedBox(height: 24),
              const Text(
                'Tu pedido actual',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGraphite,
                ),
              ),
              const SizedBox(height: 12),
              const CurrentOrderCard(
                orderId: '0042',
                title: 'Flyers',
                status: 'En producción',
                estimatedDate: '06 mar 2026',
              ),
              const SizedBox(height: 24),
              const Text(
                'Nuestros servicios',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGraphite,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primaryPink,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
      ),
    );
  }
}