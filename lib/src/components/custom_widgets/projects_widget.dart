import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

//===========>>>> Projects Widget
class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'E-Commerce App',
      'description':
          'A full-featured shopping app with product listings, cart, orders, and Firebase authentication. Integrated Stripe for payments.',
      'imageUrl': 'https://picsum.photos/seed/ecommerce/600/350',
      'tags': ['Flutter', 'Firebase', 'GetX', 'Stripe'],
      'color': Color(0xFF54C5F8),
    },
    {
      'title': 'Food Delivery App',
      'description':
          'Real-time food ordering app with Google Maps integration, live order tracking, and REST API backend connectivity.',
      'imageUrl': 'https://picsum.photos/seed/foodapp/600/350',
      'tags': ['Flutter', 'REST API', 'Google Maps', 'Provider'],
      'color': Color(0xFFFF9800),
    },
    {
      'title': 'Real-Time Chat App',
      'description':
          'End-to-end messaging app with Firebase Realtime Database, push notifications, media sharing, and online presence.',
      'imageUrl': 'https://picsum.photos/seed/chatapp/600/350',
      'tags': ['Flutter', 'Firebase', 'FCM', 'GetX'],
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'Weather Forecast App',
      'description':
          'Beautiful weather app using OpenWeatherMap API. Shows 7-day forecast, hourly updates, and location-based weather.',
      'imageUrl': 'https://picsum.photos/seed/weathersky/600/350',
      'tags': ['Flutter', 'REST API', 'GetX', 'Geolocator'],
      'color': Color(0xFF3F51B5),
    },
    {
      'title': 'Task Manager App',
      'description':
          'Productivity app with task creation, deadlines, reminders, and local storage using Hive. Supports dark mode.',
      'imageUrl': 'https://picsum.photos/seed/taskmanager/600/350',
      'tags': ['Flutter', 'Hive DB', 'Provider', 'Notifications'],
      'color': Color(0xFF9C27B0),
    },
    {
      'title': 'Fitness Tracker App',
      'description':
          'Health & fitness app that tracks workouts, steps, calories, and sleep. Integrates with device Health APIs.',
      'imageUrl': 'https://picsum.photos/seed/fitnessapp/600/350',
      'tags': ['Flutter', 'Health API', 'SQLite', 'Charts'],
      'color': Color(0xFFE91E63),
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
            text: 'My Projects',
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
            text: 'Some of my recent projects. More on GitHub!',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textColor: Color(0xFF6B7280),
          ),
          const SizedBox(height: 40),

          /// Projects Grid
          if (Responsive.isMobile)
            Column(
              children: _projects
                  .map(
                    (project) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _ProjectCard(project: project),
                    ),
                  )
                  .toList(),
            )
          else
            _buildDesktopGrid(),
        ],
      ),
    );
  }

  /// Desktop: 3-column grid layout
  Widget _buildDesktopGrid() {
    return Column(
      children: [
        for (int i = 0; i < _projects.length; i += 3)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int j = i; j < i + 3 && j < _projects.length; j++) ...[
                  Expanded(child: _ProjectCard(project: _projects[j])),
                  if (j < i + 2 && j + 1 < _projects.length)
                    const SizedBox(width: 24),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

//===========>>>> Project Card with Hover Effect
class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? (widget.project['color'] as Color).withValues(alpha: 0.5)
                : const Color(0xFFE5E7EB),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: (widget.project['color'] as Color)
                        .withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Project Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                widget.project['imageUrl'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    color: const Color(0xFFF3F4F6),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: const Color(0xFFF3F4F6),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Color(0xFF9CA3AF),
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),

            /// Project Info
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  BlackText(
                    text: widget.project['title'],
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    textColor: const Color(0xFF21243D),
                  ),
                  const SizedBox(height: 8),

                  /// Description
                  BlackText(
                    text: widget.project['description'],
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    textColor: const Color(0xFF6B7280),
                    height: 1.55,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),

                  /// Tech Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: (widget.project['tags'] as List<String>)
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: (widget.project['color'] as Color)
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: BlackText(
                              text: tag,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              textColor: widget.project['color'],
                            ),
                          ),
                        )
                        .toList(),
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
