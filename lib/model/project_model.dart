import 'package:jaspr/jaspr.dart';

class ProjectModel {
  final String imagePath, title, desc;
  final List<LinkModel> links;
  final bool isCompleted;

  ProjectModel({
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.links,
    this.isCompleted = false,
  });

  // 1. MUST be an instance method! (No 'static' keyword, no parameter needed)
  @encoder
  Map<String, dynamic> encode() {
    return {
      'imagePath': imagePath, // access the variable directly
      'title': title,
      'desc': desc,
      // Call the instance encode() method on each link
      'links': links.map((link) => link.encode()).toList(),
      'isCompleted': isCompleted,
    };
  }

  // 2. MUST be a static method (or factory) to create the object
  @decoder
  static ProjectModel decode(Map<String, dynamic> map) {
    return ProjectModel(
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
      desc: map['desc'] as String,
      links: (map['links'] as List<dynamic>)
          .map((item) => LinkModel.decode(item as Map<String, dynamic>))
          .toList(),
      isCompleted: map['isCompleted'] as bool? ?? false,
    );
  }
}

class LinkModel {
  final String title, link;
  final String? iconPath;
  final String? icon;

  LinkModel({
    required this.title,
    required this.link,
    this.iconPath,
    this.icon,
  });

  // 3. MUST be an instance method!
  @encoder
  Map<String, dynamic> encode() {
    return {
      'title': title,
      'link': link,
      'iconPath': iconPath,
      'icon': icon,
    };
  }

  // 4. MUST be a static method (or factory)
  @decoder
  static LinkModel decode(Map<String, dynamic> map) {
    return LinkModel(
      title: map['title'] as String,
      link: map['link'] as String,
      iconPath: map['iconPath'] as String?,
      icon: map['icon'] as String?,
    );
  }
}