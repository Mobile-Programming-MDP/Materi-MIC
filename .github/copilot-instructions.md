# Copilot Instructions - Materi MIC (Dart & Flutter Learning)

## Project Overview

This is a learning materials workspace for Dart and Flutter development. The workspace is organized into two main directories:
- `Dart/` - Pure Dart language exercises and examples with structured learning modules
- `Flutter/` - Flutter framework projects and tutorials

### Current Learning Modules

**Dart Fundamentals:**
1. **01-Struktur-Dasar** - Basic Dart syntax, variables, control flow, functions, and collections
   - `README.md` - Comprehensive guide covering all basic concepts
   - `contoh.dart` - Runnable examples demonstrating each concept
   - `latihan.md` - 12 progressive exercises with bonus challenges
   - `jawaban.dart` - Complete solutions with explanations

2. **02-OOP** - Object-Oriented Programming concepts in Dart
   - `README.md` - Complete OOP guide (classes, inheritance, polymorphism, abstraction, mixins, extensions)
   - `contoh.dart` - Real-world OOP examples including e-commerce simulation
   - `latihan.md` - 12 OOP exercises + bonus game system (310 total points)
   - `jawaban.dart` - Detailed solutions demonstrating best practices

## Development Environment Setup

### Dart Projects
- Dart projects should use the standard package structure with `pubspec.yaml`
- Place source files in `lib/`, tests in `test/`, and examples in `example/`
- Run Dart code: `dart run <file.dart>`
- Run tests: `dart test`

### Flutter Projects
- Flutter projects follow the standard Flutter template structure
- Main entry point: `lib/main.dart`
- Assets (images, fonts) go in `assets/` with declarations in `pubspec.yaml`
- Run app: `flutter run`
- Run tests: `flutter test`
- Build for release: `flutter build <platform>`

## Coding Conventions

### Dart Language Standards
- Follow official Dart style guide (https://dart.dev/guides/language/effective-dart)
- Use `lowerCamelCase` for variables, methods, and parameters
- Use `UpperCamelCase` for classes, enums, typedefs, and type parameters
- Use `lowercase_with_underscores` for library and file names
- Prefer `final` over `var` when variables won't be reassigned
- Use null safety (`?`, `!`, `??`) appropriately
- Private members start with underscore `_`

### Flutter Best Practices
- Separate UI into reusable widgets
- Use `const` constructors wherever possible for performance
- Prefer `StatelessWidget` over `StatefulWidget` when state is not needed
- Extract complex widget trees into separate widget classes
- Use `BuildContext` appropriately and avoid passing it unnecessarily

## Common Patterns

### Project Initialization
```bash
# Create new Dart package
dart create -t package dart-project-name

# Create new Flutter app
flutter create flutter-project-name
```

### Running Learning Materials
```bash
# Run example files
dart run Dart/01-Struktur-Dasar/contoh.dart
dart run Dart/02-OOP/contoh.dart

# Run solutions
dart run Dart/01-Struktur-Dasar/jawaban.dart
dart run Dart/02-OOP/jawaban.dart
```

### Dependencies Management
- Add dependencies in `pubspec.yaml` under `dependencies:` or `dev_dependencies:`
- Run `dart pub get` (Dart) or `flutter pub get` (Flutter) after adding dependencies
- Keep dependencies up to date with `dart pub upgrade` or `flutter pub upgrade`

### Testing Approach
- Write unit tests for business logic in `test/`
- Use `test` package for Dart, `flutter_test` for Flutter
- Widget tests for Flutter UI components
- Integration tests in `integration_test/` for end-to-end scenarios

## Learning Structure

Each learning module follows a consistent structure:
- **README.md** - Comprehensive theory with code snippets and explanations
- **contoh.dart** - Executable examples demonstrating all concepts in practice
- **latihan.md** - Progressive exercises with point-based grading system
- **jawaban.dart** - Complete solutions with best practices and validation

### Exercise Grading System
- Exercises use point-based grading (typically 200-300 points total)
- Grade thresholds: A (85%+), B (70-84%), C (60-69%), D (50-59%), E (<50%)
- Bonus exercises available for extra credit
- Solutions demonstrate error handling, edge cases, and clean code principles

## OOP Patterns in Codebase

### Encapsulation Example
Private properties use `_` prefix. Access via getters/setters:
```dart
class BankAccount {
  double _balance;
  double get balance => _balance;
  void deposit(double amount) { /* validation */ }
}
```

### Inheritance Pattern
Use `extends` for class hierarchies, `implements` for interfaces:
```dart
abstract class Shape {
  double area();
}
class Circle extends Shape {
  @override
  double area() => pi * radius * radius;
}
```

### Mixin Usage
Combine behaviors without inheritance:
```dart
mixin WiFiConnectable {
  void connectWiFi(String ssid) { /* ... */ }
}
class SmartTV with WiFiConnectable { /* ... */ }
```

## Notes for AI Agents

- This is a learning environment - prioritize clear, educational code over production optimization
- Include helpful comments explaining Dart/Flutter concepts
- When suggesting code, explain the "why" behind language features or framework patterns
- Reference official documentation when introducing new concepts
- For exercises, provide hints rather than full solutions unless specifically requested
- Code examples should demonstrate proper error handling and edge case management
- Follow the established file structure when creating new learning modules
- Maintain consistency with existing naming conventions and organization patterns
