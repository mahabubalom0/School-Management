## 🏗 Directory Structure

This project completely isolates responsibilities across dedicated modules:

```text
lib/
├── app.dart                        # Core MaterialApp Initialization
├── main.dart                       # App entry point & Storage bootstrap
├── bindings/
│   └── app_binding.dart            # Global Dependency Injection
├── core/                           # Foundation Utilities shared globally
│   ├── config/                     # Environment & Flavor configurations (Dev, Staging, Prod)
│   ├── network/                    # Pure Network Layer (Decoupled from UI)
│   ├── storage/                    # GetStorage persistence interface
│   ├── theme/                      # Separated Dark/Light mode color schemes (AppColorScheme)
│   ├── localization/               # Externalized EN, AR, BN mapped translations
│   ├── utils/                      # Responsive Engine, Assets mapper, Validators
│   └── widgets/                    # Core generic UI components
├── features/                       # Modular business logic features
│   ├── splash/                     # Navigation & Auth logic hub
│   ├── onboarding/                 # First-time user experience
│   ├── auth/                       # Login & Registration modules
│   ├── main/                       # Bottom Navigation & Rail hub
│   └── home/                       # Feature-specific Repository, Binding, and Controller
└── routes/
    ├── app_pages.dart              # Route mappings with Feature Bindings
    └── app_routes.dart             # Static route URL constants
```


## ✨ Premium Features Included

### 🏗 1. Feature-First Clean Architecture
- **Decoupled Layers**: UI → Controller → Repository → NetworkCaller.
- **Repository Pattern**: Data mapping (JSON to Object) happens in the Repository, keeping Controllers focused strictly on UI state.
- **Feature Bindings**: Controllers are lazy-loaded only when the user enters a route and disposed when they leave, optimizing memory usage.

### 📱 2. Global Responsive Engine
- **AppSizeClass**: Handles Mobile, Tablet, Desktop, and TV natively.
- **Context-Free Sizing**: Use `getHeight(100)`, `getSp(16)`, etc., anywhere in your logic or UI.

### 🌐 3. Multi-Environment Support (Flavors)
- **EnvConfig**: Built-in support for Development, Staging, and Production environments.
- **Dynamic BaseURLs**: Automatically switches API endpoints based on the active environment.

### 📡 4. Pure Network Engine
- **Decoupled UI**: Network errors are passed back to the caller, allowing the UI to decide how to display them (Snackbar, Dialog, or Error Screen).
- **Auto-Token Refresh**: Sophisticated JWT refresh logic with recursion guards built-in.
- **Connectivity Guard**: Automatic check for internet connection before every request.

### 🌍 5. Globalization & RTL
- **Multi-Language**: English, Arabic, and Bengali supported out-of-the-box.
- **RTL Support**: Arabic layout handles right-to-left directionality perfectly.

### 🖥️ 6. Adaptive UI (Mobile & Desktop)
- **Hybrid Navigation**: Automatically switches between `BottomNavigationBar` and `NavigationRail` based on screen width.
- **Platform Optimized**: Designed for touch, mouse, and keyboard interactions.