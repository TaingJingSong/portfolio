class Tool {
  final String name;
  final String slug;
  final String description;
  final String icon;
  final String category;

  const Tool({
    required this.name,
    required this.slug,
    required this.description,
    required this.icon,
    required this.category,
  });
}

const tools = [
  Tool(name: 'JSON Formatter', slug: 'json-formatter', description: 'Format, validate and minify JSON', icon: '{ }', category: 'Dev'),
  Tool(name: 'Color Picker', slug: 'color-picker', description: 'Pick colors and convert HEX/RGB/HSL', icon: '🎨', category: 'Dev'),
  Tool(name: 'Base64', slug: 'base64', description: 'Encode and decode Base64 strings', icon: '⇄', category: 'Dev'),
  Tool(name: 'Regex Tester', slug: 'regex-tester', description: 'Test and debug regular expressions', icon: '.*', category: 'Dev'),
  Tool(name: 'JSON → Dart', slug: 'json-to-dart', description: 'Generate Dart model classes from JSON', icon: '🎯', category: 'Flutter'),
  Tool(name: 'Unit Converter', slug: 'unit-converter', description: 'Convert between common units', icon: '⟷', category: 'Converter'),
  Tool(name: 'Timestamp', slug: 'timestamp', description: 'Convert Unix timestamps to dates', icon: '🕐', category: 'Converter'),
  Tool(name: 'UUID Generator', slug: 'uuid', description: 'Generate random UUIDs', icon: '#', category: 'Dev'),
  Tool(name: 'AI Code Reviewer', slug: 'ai-code-reviewer', description: 'Review Flutter/Dart code with AI', icon: '🤖', category: 'AI'),
  Tool(name: 'AI Commit Message', slug: 'ai-commit', description: 'Generate git commit messages with AI', icon: '✨', category: 'AI'),
];