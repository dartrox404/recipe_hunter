# 🍔 Recipe Hunter — Flutter App

A cross-platform food recipe app built with Flutter, featuring real internet detection, staggered grid layout, and clean architecture.

> ⚠️ Note: Demo assets used for UI purposes — not real recipe content.

---

## 📱 Screenshots


<!-- ![Onboarding](assets/indi/Screenshot 2026-04-30 225008.png) -->
<!-- ![Home](assets/indi/Screenshot 2026-04-30 220618.png) -->
<!-- ![No Internet](screenshots/details.png) -->

---

## ✨ Features

- 🌐 **Real Internet Detection** — Pings Google to verify actual connectivity, not just WiFi signal
- 🍕 **Category Switching** — Burgers, Pizza, Biryani, Cakes, Drinks, Breads, Noodles
- 🧱 **Masonry Grid Layout** — Staggered grid using `flutter_staggered_grid_view`
- 📡 **Reactive Stream** — StreamBuilder reacts instantly to internet state changes
- 🎨 **Gradient Overlay** — Linear gradient fade on hero images
- 📦 **Clean Architecture** — Models, services, widgets, and constants fully separated
- 🖼️ **WebP Images** — Optimized assets for faster loading

---

## 🏗️ Architecture

```
lib/
  src/
    application/
      presentation/
        pages/          # Full screens
        widgets/        # Reusable UI components
    core/
      constants/        # AppColors, AppSizes, AppTextStyles
    data/
      models/           # Data models (Category, Ingredients, Recipe)
      services/         # NoInternetService (Singleton)
```

---

## 📦 Packages Used

| Package | Purpose |
|---|---|
| `connectivity_plus` | Device connectivity check |
| `http` | HTTP ping for real internet verification |
| `flutter_staggered_grid_view` | Masonry grid layout |
| `iconsax` | Modern icon set |
| `gap` | Clean spacing widget |

---

## 🔌 Internet Detection — How It Works

Most apps just check if WiFi is connected. This app goes further:

```dart
// 1. Check device connectivity
final response = await _connectivity.checkConnectivity();

// 2. If connected — verify REAL internet with HTTP ping
final result = await http
    .get(Uri.parse('https://www.google.com'))
    .timeout(const Duration(seconds: 5));

// 3. Stream result to UI via StreamBuilder
_streamController.add(result.statusCode == 200);
```

This means users get the no-internet screen even when connected to a router with no data.

---

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/arslanjaved45/recipe-hunter-app.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 👨‍💻 Author

**Arslan Javed** — Flutter Developer  
📧 arslanjaved57420@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/arslan-javed-060aaa35b)  
🐙 [GitHub](https://github.com/arslanjaved45)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).