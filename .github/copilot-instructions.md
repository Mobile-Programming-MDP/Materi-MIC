# Copilot Instructions - Materi MIC (Dart & Flutter Learning)

## Project Architecture

This is a **structured learning repository** for Dart and Flutter, following a pedagogical content pattern. The architecture separates learning materials (`main` branch) from solutions (`solution` branch).

### Directory Structure
```
Dart/
├── 01-Struktur-Dasar/      # Fundamentals (200 points)
│   ├── README.md            # Theory: variables, control flow, functions, collections
│   ├── contoh.dart          # Runnable examples with comprehensive demos
│   └── latihan.md           # 12 exercises + bonus (point-based grading)
└── 02-OOP/                  # Object-Oriented Programming (310 points)
    ├── README.md            # Theory: classes, inheritance, polymorphism, mixins
    ├── contoh.dart          # Real-world scenarios (e-commerce, media player)
    └── latihan.md           # 12 OOP exercises (library, banking, restaurant systems)
Flutter/                     # Coming soon
```

### Critical Branch Strategy
- **`main`**: Teaching materials WITHOUT solutions (README, contoh, latihan only)
- **`solution`**: Complete materials INCLUDING `jawaban.dart` files
- **NEVER commit `jawaban.dart` to `main` branch** - this preserves learning integrity

## Developer Workflow

### Running Learning Materials
```bash
# Execute examples from root directory
dart run Dart/01-Struktur-Dasar/contoh.dart
dart run Dart/02-OOP/contoh.dart

# Switch to solution branch to run/view answers
git checkout solution
dart run Dart/01-Struktur-Dasar/jawaban.dart
git checkout main
```

### Creating New Modules
When adding new learning modules (e.g., `03-Async-Programming`):
1. **On `main` branch**: Create README.md, contoh.dart, latihan.md
2. **Switch to `solution` branch**: Add jawaban.dart
3. Follow the established 4-file pattern consistently
4. Update root README.md with new module in Table of Contents

## Coding Conventions

### Dart Language Standards
- Follow official Dart style guide (https://dart.dev/guides/language/effective-dart)
- Use `lowerCamelCase` for variables, methods, and parameters
- Use `UpperCamelCase` for classes, enums, typedefs, and type parameters
- Use `lowercase_with_underscores` for library and file names
- Prefer `final` over `var` when variables won't be reassigned
- Use null safety (`?`, `!`, `??`) appropriately
- Private members start with underscore `_`

### Exercise Code Patterns
**Seen in `jawaban.dart` files:**
```dart
// Main function orchestrates all exercises
void main() {
  print('=== JAWABAN LATIHAN [MODULE NAME] ===\n');
  print('SOAL 1: [Title]');
  soal1();
  print('\n${'=' * 50}');
  print('SOAL 2: [Title]');
  soal2();
  // ... continue for all exercises
}

// Each exercise in separate function
void soal1() {
  // Implementation with clear output
}
```

**Key patterns in solutions:**
- Comprehensive error handling and validation
- Edge case coverage (empty lists, division by zero, invalid input)
- Rich console output with formatting (`===`, visual separators)
- Demonstrative examples showing multiple use cases per function

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
