import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

//===========>>>> Skills Widget
class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  final List<Map<String, dynamic>> _skills = [
    {'name': 'Flutter', 'icon': Icons.phone_android, 'color': Color(0xFF54C5F8)},
    {'name': 'Dart', 'icon': Icons.code, 'color': Color(0xFF00BCD4)},
    {'name': 'Firebase', 'icon': Icons.local_fire_department, 'color': Color(0xFFFF9800)},
    {'name': 'REST APIs', 'icon': Icons.api, 'color': Color(0xFF4CAF50)},
    {'name': 'Git & GitHub', 'icon': Icons.merge_type, 'color': Color(0xFFF44336)},
    {'name': 'GetX', 'icon': Icons.settings_suggest, 'color': Color(0xFF9C27B0)},
    {'name': 'Provider', 'icon': Icons.layers, 'color': Color(0xFF3F51B5)},
    {'name': 'Android', 'icon': Icons.android, 'color': Color(0xFF4CAF50)},
    {'name': 'iOS', 'icon': Icons.phone_iphone, 'color': Color(0xFF607D8B)},
    {'name': 'UI/UX Design', 'icon': Icons.design_services, 'color': Color(0xFFE91E63)},
    {'name': 'Hive DB', 'icon': Icons.storage, 'color': Color(0xFFFF5722)},
    {'name': 'SQLite', 'icon': Icons.dataset, 'color': Color(0xFF795548)},
  ];

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Container(
      color: const Color(0xFFF9F9F9),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile ? 16 : 140,
        vertical: Responsive.isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section Title
          BlackText(
            text: 'Skills & Technologies',
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
            text: 'Technologies and tools I work with on a daily basis.',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textColor: Color(0xFF6B7280),
          ),
          const SizedBox(height: 36),

          /// Skills Chips — Wrap for responsiveness
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _skills
                .map(
                  (skill) => _SkillChip(
                    name: skill['name'],
                    icon: skill['icon'],
                    color: skill['color'],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

//===========>>>> Individual Skill Chip with Hover
class _SkillChip extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;

  const _SkillChip({
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.color, width: 1.5),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: _isHovered ? Colors.white : widget.color,
              size: 18,
            ),
            const SizedBox(width: 8),
            BlackText(
              text: widget.name,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              textColor: _isHovered ? Colors.white : const Color(0xFF21243D),
            ),
          ],
        ),
      ),
    );
  }
}
