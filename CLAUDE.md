# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository layout

The repository root contains course scaffolding; the actual Flutter app lives in [clinic_portfolio/](clinic_portfolio/). All commands below must be run from that subdirectory.

The app is `clinic_portfolio` — a "Multi-Specialty Healthcare Clinic Portfolio" Flutter app built for COMP-5450 Challenge 2. Dart SDK `^3.12.0`, Flutter Material, uses `provider` ^6.1.2 for state management and `flutter_svg` ^2.0.10 for SVG rendering.

## Common commands

Run from `clinic_portfolio/`:

- `flutter pub get` — fetch dependencies
- `flutter run` — launch on the selected device (use `-d chrome|macos|ios|android`)
- `flutter analyze` — static analysis / lint (config in [analysis_options.yaml](clinic_portfolio/analysis_options.yaml), based on `flutter_lints`)
- `flutter test` — run all widget/unit tests
- `flutter test test/widget_test.dart` — run a single test file; append `--plain-name "<test name>"` to filter
- `dart run flutter_launcher_icons` — regenerate all platform launcher icons from `assets/branding/launcher_icon.png`

The app entry point is [lib/main.dart](clinic_portfolio/lib/main.dart). It pre-warms the SVG logo cache before the first frame, then runs `ClinicPortfolioApp` ([lib/app/app.dart](clinic_portfolio/lib/app/app.dart)), which opens `SplashPage` as `home`.

## App startup flow

`SplashPage` ([features/splash/presentation/views/splash_page.dart](clinic_portfolio/lib/features/splash/presentation/views/splash_page.dart)) fades in the logo for ~2 s, then replaces itself with `RootShell` via a fade transition. There is no named-route table; this is the only programmatic navigation on cold start.

## Architecture

The codebase follows **feature-first Clean Architecture** with three layers per feature plus shared composition roots. Understanding this layout is essential — features are not free-form; each one mirrors the same shape.

### Top-level structure under `lib/`

- `app/` — composition root: `ClinicPortfolioApp`, `ServiceLocator` (DI), theme.
- `features/<feature>/` — one folder per feature: `home`, `services`, `programs`, `team`, `locations`, `about`, `shell`, `splash`.
- `shared/` — cross-feature primitives: `ViewState<T>` enum-based state wrapper, generic state-view widgets, section headers, and constants (`AppConstants`, `AppAssets`, `AppBranding`).

### Per-feature layering

Each feature (except `shell`, `splash`, and `about`) follows:

```
features/<name>/
  domain/        # pure Dart: entities/, repositories/ (abstract), usecases/
  data/          # models/ (with toEntity), datasources/ (local), repositories/ (impl)
  presentation/  # viewmodels/ (ChangeNotifier), views/ (pages), widgets/
```

Data flows: **DataSource → Repository (impl of domain interface) → UseCase → ViewModel → View**. ViewModels expose a `ViewState<T>` (see [view_state.dart](clinic_portfolio/lib/shared/presentation/state/view_state.dart)) with `idle/loading/success/error`; views render via `StateViews` helpers in `shared/presentation/widgets/`.

### Dependency injection

DI is a hand-rolled singleton: [lib/app/di/service_locator.dart](clinic_portfolio/lib/app/di/service_locator.dart) (`ServiceLocator.instance`) lazily wires every repository, datasource, and use case. New features should register their repository + use cases here.

ViewModels are provided app-wide via `MultiProvider` in [app.dart](clinic_portfolio/lib/app/app.dart). Each `ChangeNotifierProvider` receives use cases from the `ServiceLocator`. To add a feature: add use case wiring in `ServiceLocator`, then add a `ChangeNotifierProvider` for its ViewModel in `app.dart`.

### Navigation

No router package. The app uses `RootShell` ([features/shell/presentation/views/root_shell.dart](clinic_portfolio/lib/features/shell/presentation/views/root_shell.dart)) with a **custom** bottom nav bar (not the built-in `BottomNavigationBar`). Detail pages are pushed via `Navigator`.

#### Custom bottom nav bar — key design points

- Implemented as private classes `_BottomNavBar`, `_NavItem`, `_NavItemData` in `root_shell.dart`.
- Each item uses its own `InkWell` (which defaults to `containedInkWell: true`) so the ripple is clipped to that item's bounds and cannot bleed into adjacent items.
- `Row(crossAxisAlignment: CrossAxisAlignment.stretch)` makes each `InkWell` fill the full bar height.
- Safe-area inset is managed manually (`MediaQuery.padding.bottom`) — no `SafeArea` wrapper — so the ripple extends to the physical bottom edge of the screen.
- A 1 px `Divider` (colour `AppColors.divider`) sits between the `AppBar` (via `AppBar.bottom: PreferredSize`) and the body, and between the body and the nav bar.

### Data sources

All datasources today are **local / in-memory** (`*_local_datasource.dart`); there is no backend. Repository implementations adapt data-layer models to domain entities via `toEntity()` on each model.

### Theming & constants

- [lib/app/theme/](clinic_portfolio/lib/app/theme/) — `AppTheme.light`, `AppColors`, `AppTextStyles`.
- [lib/shared/constants/app_constants.dart](clinic_portfolio/lib/shared/constants/app_constants.dart) — app-wide strings (`AppConstants.appName`, `AppConstants.tagline`).
- [lib/shared/constants/app_assets.dart](clinic_portfolio/lib/shared/constants/app_assets.dart) — typed asset paths (`AppAssets.cardBackground`).
- [lib/shared/constants/app_branding.dart](clinic_portfolio/lib/shared/constants/app_branding.dart) — brand asset paths (`AppBranding.logo` SVG, `AppBranding.fallbackIcon`).

### Shared widgets

- `AppLogo` ([shared/presentation/widgets/app_logo.dart](clinic_portfolio/lib/shared/presentation/widgets/app_logo.dart)) — renders the SVG brand mark via `flutter_svg`. Pass `badge: true` to wrap it in a circular white container with a soft shadow.
- `SectionHeader` — eyebrow / title / subtitle block used across feature list pages.
- `StateViews` — generic loading / error / empty state renderers tied to `ViewState<T>`.

## Assets

```
assets/
  branding/
    logo.svg              # SVG brand mark (source of truth)
    launcher_icon.png     # 1024×1024 PNG derived from logo.svg; input for flutter_launcher_icons
  images/
    card_background.jpg   # Photo used as the home-screen hero background
  svgs/                   # Reserved for future SVG assets
```

All three folders are declared under `flutter: assets:` in [pubspec.yaml](clinic_portfolio/pubspec.yaml).

### Launcher icons

`flutter_launcher_icons` (dev dependency) stamps all platform icon sets from `assets/branding/launcher_icon.png`. Config is inline in `pubspec.yaml`. After changing the logo, regenerate with:

```sh
dart run flutter_launcher_icons
```

`remove_alpha_ios: true` is set so iOS icons are App Store compliant (alpha flattened to white).

### Home hero

The hero card in `HomePage._Hero` uses a three-layer `Stack` inside a `ClipRRect` (24 px radius):

1. `Image.asset(AppAssets.cardBackground, fit: BoxFit.cover)` — photo fill
2. `DecoratedBox` with a semi-transparent `LinearGradient` overlay — ensures white text contrast
3. `Padding → Column` — pill badge, title, tagline, CTA button

## Lint notes

`prefer_initializing_formals` is disabled project-wide (see [analysis_options.yaml](clinic_portfolio/analysis_options.yaml)) because private fields with named params can't use initializing formals.
