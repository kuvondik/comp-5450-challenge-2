# COMP-5450 Mobile Programming Course, Challenge 2

## Project Overview

This repository contains **Infinity Health Centre** — a multi-specialty healthcare clinic portfolio app built with Flutter. The app showcases a clinic's services, wellness programs, practitioner team, and contact information through a clean, brand-consistent mobile experience. It implements Clean Architecture (MVVM + feature-first layering) with `provider` for reactive state management.

## Core Features

### Clinic Showcase

- Browsable catalogue of medical and allied health services
- Wellness and preventive care programs listing
- Team directory with individual practitioner profiles
- Location and contact information for all clinic sites

### Home Screen

- Hero banner with photo background, gradient overlay, and a one-tap appointment CTA
- At-a-glance stats (services, practitioners, hours)
- Featured services grid and team highlights
- Quick-link tiles for About and Contact sections

### UX Details

- Animated splash screen with brand fade-in on cold start
- Custom bottom navigation bar with per-item contained ripple effects (ripple spans full item height to the physical bottom edge)
- 1 px dividers below the `AppBar` and above the bottom nav for visual separation
- `RefreshIndicator` on the home feed
- Detail pages for services and team members pushed via `Navigator`

## Architecture Structure

The project follows feature-first Clean Architecture with three layers per feature.

### Domain Layer (pure Dart, no Flutter dependencies)

- Entities: `ClinicService`, `HealthProgram`, `TeamMember`, `ClinicLocation`
- Abstract repository interfaces
- 4 use cases: `GetServices`, `GetPrograms`, `GetTeamMembers`, `GetLocations`

### Data Layer (local / in-memory)

- Local datasources (`*_local_datasource.dart`) holding hard-coded seed data
- Model classes with `toEntity()` adapters
- Repository implementations wired to domain interfaces

### Presentation Layer (MVVM)

- 5 `ChangeNotifier` ViewModels exposing `ViewState<T>` (`idle / loading / success / error`)
- Stateless view widgets consuming ViewModels via `Provider`
- Shared state-view helpers (`StateViews`) for consistent loading/error/empty rendering

### Composition Root

- `ServiceLocator` — hand-rolled singleton DI; lazily wires datasources → repositories → use cases
- `ClinicPortfolioApp` (`MultiProvider`) — provides all ViewModels app-wide

## App Flow

1. **Splash Screen** — fades in the brand logo for ~2 s, then cross-fades into the main shell
2. **Home** — hero card, stats row, featured services grid, team highlights, about tile, contact CTA
3. **Services** — full list of clinic services; tap any card to open the detail page
4. **Programs** — wellness and preventive care program cards
5. **Team** — practitioner directory; tap any card for a full profile
6. **Location / Contact** — clinic addresses, hours, and contact actions

Navigation between tabs is handled by `RootShell` (custom bottom nav); detail pages use `Navigator.push`.

## Installation & Setup

**Prerequisites:** Flutter SDK (3.x), Dart SDK, and a configured iOS / Android / macOS / Web environment.

```sh
git clone https://github.com/kuvondik/comp-5450-challenge-2.git
cd comp-5450-challenge-2/clinic_portfolio
flutter pub get
flutter run
```

Target a specific platform:

```sh
flutter run -d macos
flutter run -d chrome
flutter run -d ios       # requires Xcode
flutter run -d android   # requires Android SDK
```

## Testing

```sh
flutter test                                        # all tests
flutter test test/widget_test.dart                  # single file
flutter test --plain-name "<test name>"             # filter by name
```

## Configuration

**App name / tagline / mission statement:** `lib/shared/constants/app_constants.dart`

**Asset paths:** `lib/shared/constants/app_assets.dart` (images) and `lib/shared/constants/app_branding.dart` (SVG logo, fallback icon)

**Colours:** `lib/app/theme/app_colors.dart`

**Text styles:** `lib/app/theme/app_text_styles.dart`

**Seed data:** each feature's `*_local_datasource.dart` under `lib/features/<name>/data/datasources/`

**Launcher icons:** configured in `pubspec.yaml` under `flutter_launcher_icons`. After updating `assets/branding/logo.svg`, regenerate the PNG and re-stamp all platform icon sets:

```sh
# 1. Re-render the SVG to PNG (requires rsvg-convert or equivalent)
rsvg-convert -w 1024 -h 1024 assets/branding/logo.svg -o assets/branding/launcher_icon.png

# 2. Stamp all platform icon sets
dart run flutter_launcher_icons
```

## Key Dependencies

| Package                              | Version   | Purpose                                   |
| ------------------------------------ | --------- | ----------------------------------------- |
| `provider`                         | ^6.1.2    | `ChangeNotifier`-based state management |
| `flutter_svg`                      | ^2.0.10+1 | SVG brand mark rendering                  |
| `cupertino_icons`                  | ^1.0.8    | iOS-style icon glyphs                     |
| `flutter_launcher_icons` *(dev)* | ^0.14.3   | Cross-platform launcher icon generation   |
| `flutter_lints` *(dev)*          | ^6.0.0    | Recommended lint rule set                 |

## Project Statistics

- 56 Dart source files (`lib/`)
- 8 features: `home`, `services`, `programs`, `team`, `locations`, `about`, `shell`, `splash`
- 4 domain entities, 4 use cases, 5 ViewModels
- Platforms: iOS, Android, macOS, Web

## License

MIT License — see [LICENSE](LICENSE) for details.

---

*COMP-5450 Mobile Programming Course — Challenge 2, demonstrating Flutter Clean Architecture and brand-consistent UI design.*
