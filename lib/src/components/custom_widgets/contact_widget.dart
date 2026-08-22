import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';
import 'package:url_launcher/url_launcher.dart';

//===========>>>> Contact Widget
class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  final List<Map<String, dynamic>> _contactItems = [
    {
      'icon': Icons.email_outlined,
      'label': 'Email',
      'value': 'arslanqazi1999@gmail.com',
      'url': 'mailto:arslanqazi1999@gmail.com',
      'color': Color(0xFF4CAF50),
    },
    {
      'icon': Icons.code,
      'label': 'GitHub',
      'value': 'github.com/ArslanXXQazi',
      'url': 'https://github.com/ArslanXXQazi',
      'color': Color(0xFF21243D),
    },
    {
      'icon': Icons.business,
      'label': 'LinkedIn',
      'value': 'Muhammad Arsalan Qazi',
      'url': 'https://www.linkedin.com/in/muhammad-arsalan-qazi-92ba5b293/',
      'color': Color(0xFF0077B5),
    },
  ];

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile ? 16 : 140,
        vertical: Responsive.isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section Title
          BlackText(
            text: "Let's Connect",
            fontSize: Responsive.isMobile ? 22 : 32,
            fontWeight: FontWeight.w700,
            textColor: const Color(0xFF21243D),
          ),
          const SizedBox(height: 10),
          Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          const BlackText(
            text: "Have a project in mind? I'd love to work with you. Reach out!",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textColor: Color(0xFF6B7280),
          ),
          const SizedBox(height: 40),

          /// Mobile Layout: Stack vertically
          if (Responsive.isMobile)
            Column(
              children: [
                _buildContactCards(),
                const SizedBox(height: 32),
                _buildHireMe(),
              ],
            )
          else

          /// Desktop Layout: Side by Side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Left — Contact Info Cards
                Expanded(
                  flex: 5,
                  child: _buildContactCards(),
                ),
                const SizedBox(width: 60),

                /// Right — Hire Me Card
                Expanded(
                  flex: 4,
                  child: _buildHireMe(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  /// Contact Info Cards
  Widget _buildContactCards() {
    return Column(
      children: _contactItems
          .map((item) => _ContactCard(item: item))
          .toList(),
    );
  }

  /// Hire Me / CTA Card
  Widget _buildHireMe() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF21243D), Color(0xFF3D4070)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF21243D).withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BlackText(
            text: 'Open to Work 🚀',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
          ),
          const SizedBox(height: 12),
          const BlackText(
            text:
                "I'm currently available for freelance projects, full-time roles, and exciting collaborations. Let's build something amazing together!",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            textColor: Color(0xFFB0B3C6),
            height: 1.7,
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () async {
              final uri = Uri.parse('https://wa.me/923483424529');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.send_outlined, size: 16),
                SizedBox(width: 8),
                BlackText(
                  text: 'Send Me a Message',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//===========>>>> Individual Contact Card
class _ContactCard extends StatefulWidget {
  final Map<String, dynamic> item;

  const _ContactCard({required this.item});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color color = widget.item['color'] as Color;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final urlStr = widget.item['url'] as String?;
          if (urlStr != null) {
            final uri = Uri.parse(urlStr);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered ? color.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? color : const Color(0xFFE5E7EB),
              width: _isHovered ? 1.5 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.15),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    const BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  widget.item['icon'] as IconData,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: widget.item['label'],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: const Color(0xFF9CA3AF),
                    ),
                    const SizedBox(height: 2),
                    BlackText(
                      text: widget.item['value'],
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xFF21243D),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: _isHovered ? color : const Color(0xFFD1D5DB),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
