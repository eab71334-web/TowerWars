import 'package:flutter/material.dart';

void main() {
  runApp(const TowerWarsApp());
}

class TowerWarsApp extends StatelessWidget {
  const TowerWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tower Wars',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1428),
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF1E2850),
              Color(0xFF090C18),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // الشريط العلوي
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('20:15', style: TextStyle(color: Colors.white, fontSize: 12)),
                    const Text('برج الكتل - القائمة الرئيسية',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: const [
                        Icon(Icons.wifi, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text('85%', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // حاوية الأزرار الرئيسية
              Container(
                width: 320,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF131B36).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF2C3E75), width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // زر ابدأ اللعب
                    _buildMainButton(
                      title: 'ابدأ اللعب\nالآن!',
                      icon: Icons.play_arrow_rounded,
                      color: const Color(0xFF2196F3),
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),

                    // خيارات اللعب
                    Row(
                      children: [
                        Expanded(
                          child: _buildSecondaryButton(
                            title: 'تدريب منفرد',
                            icon: Icons.lightbulb_outline,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildSecondaryButton(
                            title: 'تحدي الأصدقاء',
                            icon: Icons.people_outline,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // المتجر والإعدادات
                    Row(
                      children: [
                        Expanded(
                          child: _buildSecondaryButton(
                            title: 'المتجر',
                            icon: Icons.shopping_cart_outlined,
                            hasBadge: true,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildSecondaryButton(
                            title: 'الإعدادات',
                            icon: Icons.settings_outlined,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // زر المتصدرون
                    _buildFullWidthButton(
                      title: 'المتصدرون',
                      icon: Icons.emoji_events_amber_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // أرقام الاصدار والمعرف
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'الإصدار v1.2 | معرف اللاعب: User9876',
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(icon, color: Colors.white, size: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required String title,
    required IconData icon,
    bool hasBadge = false,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF1C274C),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2E3F73)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.cyanAccent, size: 26),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasBadge)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('!', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullWidthButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF1C274C),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2E3F73)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.amber, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
