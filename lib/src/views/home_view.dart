import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return SafeArea(
      child: Scaffold(
        endDrawer: Responsive.isMobile
            ? Drawer(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              BlackText(
                text: "Works",
                fontSize: 18,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
              BlackText(
                text: "Blog",
                fontSize: 18,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
              BlackText(
                text: "Contact",
                fontSize: 18,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        )
            : null,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (Responsive.isMobile)
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    )
                  else
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlackText(onTap: () {}, text: "Works"),
                        const SizedBox(width: 20),
                        BlackText(onTap: () {}, text: "Blog"),
                        const SizedBox(width: 20),
                        BlackText(onTap: () {}, text: "Contact"),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}