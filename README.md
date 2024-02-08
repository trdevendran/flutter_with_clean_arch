# flutter_poc

This is a Flutter project showcasing the implementation of Clean Architecture with the BLoC pattern.
The project is structured to promote separation of concerns, maintainability, and scalability.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Features](#features)
- [Architecture Overview](#architecture-overview)
- [Code Organization](#code-organization)

## Introduction

This project made is for a system task for the flutter app development which follows the principles
of Clean Architecture, promoting a separation of concerns into layers (presentation, domain, and
data) for improved maintainability and testability. The BLoC (Business Logic Component) pattern is
employed for state management.

## Project Structure

The project is organized into the following main directories:

- `lib`: Contains the Dart source code.
    - `data`: Implementation of data layer (repositories, data sources).
    - `domain`: Business logic layer (entities, use cases, repositories interfaces).
    - `presentation`: User interface layer (UI components, BLoCs).
    - `core`: Shared code and utilities.
    - `injections`: Dependency injection setup.
- `test`: Unit and widget tests.

## Technologies Used

- Flutter
- Dart
- BLoC Pattern
- GetIt as Dependency Injection
- Clean Architecture
- http (HTTP client for data layer)
- flutter_test (for testing)

## Getting Started

1. Clone the repository and prepare codebase to run:
   ```bash
   git clone https://github.com/trdevendran/flutter_poc.git
   cd flutter_poc
   flutter pub get
   flutter run
2. Open your preferred IDE and make sure the platform type to build and run as this will support below mentioned platforms
    - Android
    - iOS
    - Web

## Features
1. Login Page with static credential
> username: lions@gmail.com | password: Bot1234$
2. Home Page with 4 sub pages with tab and one action menu at the center of the bottom navigation menu
3. Profile Page - Contains Profile info and two more segmentations.
> Points & Badges - These two segmentation will be shown at the top of the screen as a sticky header to make sure good UX.
4. Messages
5. Settings
6. Remote Control robot
> It has a cool and customized Joystick with some other controls

## Architecture Overview

### System Overview Diagram:
```yaml
+--------------------------+
|    Presentation       |
|        Layer             |
+-------------------------+
|                             |
|   Business Logic    |
|      (Domain)          |
|        Layer             |
|                             |
+--------------------------+
|      Data Layer       |
+-------------------------+
```

### Clean Architecture Layers:
```yaml
+---------------------+
|      Entities       |
|       Layer         |
+---------------------+
↑
+-----------------------+
|      Use Cases    |
|       Layer          |
+----------------------+
↑
+------------------------------+
|   Interface Adapters   |
|       Layer                   |
+------------------------------+
↑
+-------------------------------+
|   Frameworks & Tools |
|       Layer                   |
+-------------------------------+
```

### Presentation Layer

The presentation layer is responsible for handling user interface components. It uses Flutter widgets, screens, and BLoCs to manage UI state.

### Domain Layer

The domain layer contains the business logic of our application. It includes entities representing core business concepts and use cases to encapsulate business rules and application logic.

### Data Layer

The data layer is responsible for interacting with external data sources. It includes repositories and data sources for retrieving and storing data.

### Data Flow

Data flows through our system from the user interface to the domain layer and back. Dependencies are carefully managed to ensure a clean and modular architecture.

For code examples and more details, explore our project further. Feel free to contribute, ask questions, or provide feedback. We appreciate your involvement in our project!

## Code Organization
### Root Directory:
```yaml
├── lib/
├── test/
├── android/
├── ios/
├── web/
├── pubspec.yaml
└── README.md
```
### `lib` Directory:
```yaml
lib/
├── core/
├── features/
├── injections/
└── main.dart
```

### `main.dart`

The `main.dart` file serves as the main entry point for our application. It includes configurations and features necessary for the app to run.

Explore the project further to see code examples and understand the interaction between different layers. Feel free to contribute or ask questions if needed.
