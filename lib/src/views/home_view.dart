import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';
import 'package:portfolio/src/components/custom_widgets/intero_widget.dart';
import 'package:portfolio/src/components/custom_widgets/skills_widget.dart';
import 'package:portfolio/src/components/custom_widgets/projects_widget.dart';
import 'package:portfolio/src/components/custom_widgets/contact_widget.dart';
import 'package:portfolio/src/components/custom_widgets/footer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //===========>>>> GlobalKeys — har section ke liye
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  //===========>>>> Smooth Scroll Function
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  //===========>>>> Drawer Band pe tap + scroll
  void _drawerScrollTo(BuildContext drawerContext, GlobalKey key) {
    Navigator.pop(drawerContext);
    // Drawer close hone ke baad scroll karo
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollToSection(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return SafeArea(
      child: Scaffold(
        endDrawer: Responsive.isMobile
            ? Drawer(
                backgroundColor: Colors.grey.shade400,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  children: [
                    BlackText(
                      text: "Home",
                      fontSize: 18,
                      onTap: () => _drawerScrollTo(context, _heroKey),
                    ),
                    const SizedBox(height: 20),
                    BlackText(
                      text: "Skills",
                      fontSize: 18,
                      onTap: () => _drawerScrollTo(context, _skillsKey),
                    ),
                    const SizedBox(height: 20),
                    BlackText(
                      text: "Projects",
                      fontSize: 18,
                      onTap: () => _drawerScrollTo(context, _projectsKey),
                    ),
                    const SizedBox(height: 20),
                    BlackText(
                      text: "Contact",
                      fontSize: 18,
                      onTap: () => _drawerScrollTo(context, _contactKey),
                    ),
                  ],
                ),
              )
            : null,
        body: Column(
          children: [
            //===========>>>> Navbar Row
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile ? 16 : 40,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Logo / Brand Name — Home pe scroll karta hai
                  GestureDetector(
                    onTap: () => _scrollToSection(_heroKey),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: BlackText(
                              text: 'A',
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const BlackText(
                          text: 'Arslan Qazi',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: Color(0xFF21243D),
                        ),
                      ],
                    ),
                  ),

                  /// Nav Links or Hamburger
                  if (Responsive.isMobile)
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.black, size: 28),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    )
                  else
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlackText(
                          onTap: () => _scrollToSection(_heroKey),
                          text: "Home",
                        ),
                        const SizedBox(width: 28),
                        BlackText(
                          onTap: () => _scrollToSection(_skillsKey),
                          text: "Skills",
                        ),
                        const SizedBox(width: 28),
                        BlackText(
                          onTap: () => _scrollToSection(_projectsKey),
                          text: "Projects",
                        ),
                        const SizedBox(width: 28),
                        BlackText(
                          onTap: () => _scrollToSection(_contactKey),
                          text: "Contact",
                        ),
                      ],
                    ),
                ],
              ),
            ),

            //===========>>>> Scrollable Body — All Sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// 1 — Hero / Intro
                    IntroWidget(key: _heroKey),

                    /// 2 — Skills & Technologies
                    SkillsWidget(key: _skillsKey),

                    /// 3 — Projects
                    ProjectsWidget(key: _projectsKey),

                    /// 4 — Contact
                    ContactWidget(key: _contactKey),

                    /// 5 — Footer
                    const FooterWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}