import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

//===========>>>> Experience Widget
class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  final List<Map<String, dynamic>> _experiences = [
    {
      'company': 'TechNova Solutions',
      'role': 'Senior Flutter Developer',
      'duration': 'Jan 2024 – Present',
      'location': 'Remote',
      'points': [
        'Led a team of 3 Flutter developers to build cross-platform apps for 10,000+ users.',
        'Integrated Firebase (Auth, Firestore, FCM) and third-party REST APIs.',
        'Reduced app load time by 40% through state management optimization using GetX.',
        'Conducted code reviews and mentored junior developers.',
      ],
      'color': Color(0xFF54C5F8),
      'icon': Icons.work_outline,
    },
    {
      'company': 'AppCraft Studio',
      'role': 'Flutter Developer',
      'duration': 'Jul 2022 – Dec 2023',
      'location': 'Lahore, Pakistan',
      'points': [
        'Developed and published 5+ Flutter apps on both Play Store and App Store.',
        'Built REST API integrations with Dio and http packages.',
        'Implemented complex UI/UX designs with pixel-perfect accuracy.',
        'Worked with SQLite and Hive for local data persistence.',
      ],
      'color': Color(0xFFFF9800),
      'icon': Icons.business_center_outlined,
    },
    {
      'company': 'Freelance & Open Source',
      'role': 'Flutter Developer',
      'duration': 'Jan 2022 – Jul 2022',
      'location': 'Remote',
      'points': [
        'Delivered 8+ freelance Flutter projects for clients across USA, UK & Pakistan.',
        'Worked on e-commerce, social media, and utility applications.',
        'Contributed to open-source Flutter packages on GitHub.',
      ],
      'color': Color(0xFF4CAF50),
      'icon': Icons.laptop_mac_outlined,
    },
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
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Section Title
          BlackText(
            text: 'Work Experience',
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
            text: '3+ years of professional Flutter development experience.',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textColor: Color(0xFF6B7280),
          ),
          const SizedBox(height: 40),

          /// Timeline Items
          ...List.generate(_experiences.length, (index) {
            final exp = _experiences[index];
            final isLast = index == _experiences.length - 1;
            return _TimelineItem(
              experience: exp,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }
}

//===========>>>> Timeline Item
class _TimelineItem extends StatefulWidget {
  final Map<String, dynamic> experience;
  final bool isLast;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    final Color color = widget.experience['color'] as Color;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //===========>>>> Left — Dot + Vertical Line
        SizedBox(
          width: Responsive.isMobile ? 40 : 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Colored dot with icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(
                  widget.experience['icon'] as IconData,
                  color: color,
                  size: 20,
                ),
              ),

              /// Vertical connecting line
              if (!widget.isLast)
                Container(
                  width: 2,
                  height: 32,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: const Color(0xFFE5E7EB),
                ),
            ],
          ),
        ),

        SizedBox(width: Responsive.isMobile ? 16 : 24),

        //===========>>>> Right — Card
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 32),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isHovered
                        ? color.withValues(alpha: 0.5)
                        : const Color(0xFFE5E7EB),
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: color.withValues(alpha: 0.15),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //===========>>>> Header
                    if (Responsive.isMobile)
                      _buildMobileHeader(color)
                    else
                      _buildDesktopHeader(color),

                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    const SizedBox(height: 16),

                    //===========>>>> Bullet Points
                    ...((widget.experience['points'] as List<String>).map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: BlackText(
                                text: point,
                                fontSize: Responsive.isMobile ? 12 : 14,
                                fontWeight: FontWeight.w400,
                                textColor: const Color(0xFF4B5563),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //===========>>>> Mobile Header
  Widget _buildMobileHeader(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlackText(
          text: widget.experience['role'],
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textColor: const Color(0xFF21243D),
        ),
        const SizedBox(height: 4),
        BlackText(
          text: widget.experience['company'],
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: color,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.calendar_today_outlined,
                size: 12, color: const Color(0xFF9CA3AF)),
            const SizedBox(width: 4),
            Flexible(
              child: BlackText(
                text: widget.experience['duration'],
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: const Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.location_on_outlined,
                size: 12, color: const Color(0xFF9CA3AF)),
            const SizedBox(width: 4),
            Flexible(
              child: BlackText(
                text: widget.experience['location'],
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: const Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //===========>>>> Desktop Header
  Widget _buildDesktopHeader(Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlackText(
                text: widget.experience['role'],
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: const Color(0xFF21243D),
              ),
              const SizedBox(height: 4),
              BlackText(
                text: widget.experience['company'],
                fontSize: 15,
                fontWeight: FontWeight.w600,
                textColor: color,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 13, color: const Color(0xFF9CA3AF)),
                const SizedBox(width: 4),
                BlackText(
                  text: widget.experience['duration'],
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: const Color(0xFF9CA3AF),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined,
                    size: 13, color: const Color(0xFF9CA3AF)),
                const SizedBox(width: 4),
                BlackText(
                  text: widget.experience['location'],
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: const Color(0xFF9CA3AF),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
