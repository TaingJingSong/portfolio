class Skill {
  final String name;
  final int level; // 0 to 100
  final String description; // Brief description of capability

  const Skill({
    required this.name,
    required this.level,
    required this.description,
  });
}

const List<Skill> language = [
  Skill(name: 'C#', level: 80, description: 'Backend APIs, desktop apps, and system integrations.'),
  Skill(name: 'Flutter/Dart', level: 95, description: 'Highly responsive cross-platform mobile and web applications.'),
  Skill(name: 'Python', level: 85, description: 'Data processing, automation scripts, and backend servers.'),
  Skill(name: 'FastAPI', level: 80, description: 'High-performance RESTful APIs and microservices.'),
  Skill(name: 'React Native', level: 70, description: 'Cross-platform mobile development with React Native.')
];

const List<Skill> database = [
  Skill(name: 'MySQL', level: 85, description: 'Relational database design, query optimization, and indexing.'),
  Skill(name: 'SQL Server', level: 80, description: 'Enterprise database management, stored procedures, and triggers.'),
  Skill(name: 'MongoDB', level: 75, description: 'NoSQL document storage, schemas, and aggregation pipelines.'),
  Skill(name: 'PostgreSQL', level: 85, description: 'Advanced queries, JSONB storage, and reliable server hosting.'),
];

const List<Skill> tool = [
  Skill(name: 'GitHub', level: 90, description: 'Version control, collaborative pull requests, and CI/CD pipelines.'),
  Skill(name: 'GitLab', level: 85, description: 'Git repositories, runner orchestration, and branch policies.'),
];

const List<Skill> statemanagement = [
  Skill(name: 'GetX', level: 90, description: 'Reactive state management, dependency injection, and simple routing.'),
  Skill(name: 'Riverpod', level: 85, description: 'Compile-safe, decoupled state management and provider caching.'),
  Skill(name: 'Provider', level: 95, description: 'Inherent Flutter state management and scoped widget rebuilding.'),
];

const List<Skill> other = [
  Skill(name: 'PHP', level: 75, description: 'Web servers, templating engines, and script utilities.'),
  Skill(name: 'Laravel', level: 80, description: 'MVC web frameworks, Eloquent ORM, and secure routing.'),
];
