import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

//===========>>>> Footer Widget
class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final List<Map<String, dynamic>> _socialLinks = [
    {'label': 'GitHub', 'icon': Icons.code},
    {'label': 'LinkedIn', 'icon': Icons.business},
    {'label': 'Email', 'icon': Icons.email_outlined},
    {'label': 'Twitter', 'icon': Icons.tag},
  ];

  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Container(
      color: const Color(0xFF21243D),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile ? 16 : 140,
        vertical: Responsive.isMobile ? 32 : 40,
      ),
      child: Responsive.isMobile
          ? _buildMobileFooter()
          : _buildDesktopFooter(),
    );
  }

  /// Desktop Footer — Logo, Nav, Social in a Row
  Widget _buildDesktopFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Brand
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const BlackText(
                  text: 'Flutter Developer · Building Digital Experiences',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: Color(0xFF8B8FA8),
                ),
              ],
            ),

            /// Nav Links
            Row(
              children: [
                _FooterNavItem(label: 'Works', onTap: () {}),
                const SizedBox(width: 24),
                _FooterNavItem(label: 'Projects', onTap: () {}),
                const SizedBox(width: 24),
                _FooterNavItem(label: 'Experience', onTap: () {}),
                const SizedBox(width: 24),
                _FooterNavItem(label: 'Contact', onTap: () {}),
              ],
            ),

            /// Social Links
            Row(
              children: List.generate(_socialLinks.length, (index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hoveredIndex = index),
                  onExit: (_) => setState(() => _hoveredIndex = null),
                  child: GestureDetector(
                    onTap: () {},
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(left: 12),
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: _hoveredIndex == index
                            ? Colors.red
                            : const Color(0xFF2D3154),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _socialLinks[index]['icon'] as IconData,
                        color: _hoveredIndex == index
                            ? Colors.white
                            : const Color(0xFF8B8FA8),
                        size: 18,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),

        const SizedBox(height: 28),
        const Divider(color: Color(0xFF2D3154), height: 1),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BlackText(
              text: '© 2025 Arslan Qazi. All rights reserved.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              textColor: Color(0xFF6B7280),
            ),
            Row(
              children: const [
                BlackText(
                  text: 'Built with Flutter',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: Color(0xFF6B7280),
                ),
                SizedBox(width: 4),
                Text('❤️', style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// Mobile Footer — All stacked vertically
  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Brand
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: BlackText(
                  text: 'A',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  textColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const BlackText(
              text: 'Arslan Qazi',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const BlackText(
          text: 'Flutter Developer',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          textColor: Color(0xFF8B8FA8),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        /// Social Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_socialLinks.length, (index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = null),
              child: GestureDetector(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: _hoveredIndex == index
                        ? Colors.red
                        : const Color(0xFF2D3154),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _socialLinks[index]['icon'] as IconData,
                    color: _hoveredIndex == index
                        ? Colors.white
                        : const Color(0xFF8B8FA8),
                    size: 18,
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 20),
        const Divider(color: Color(0xFF2D3154), height: 1),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BlackText(
              text: 'Built with Flutter',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textColor: Color(0xFF6B7280),
            ),
            SizedBox(width: 4),
            Text('❤️', style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        const BlackText(
          text: '© 2025 Arslan Qazi.',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textColor: Color(0xFF6B7280),
        ),
      ],
    );
  }
}

//===========>>>> Footer Nav Item
class _FooterNavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterNavItem({required this.label, required this.onTap});

  @override
  State<_FooterNavItem> createState() => _FooterNavItemState();
}

class _FooterNavItemState extends State<_FooterNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: BlackText(
          text: widget.label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: _isHovered ? Colors.white : const Color(0xFF8B8FA8),
        ),
      ),
    );
  }
}
