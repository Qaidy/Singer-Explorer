# 🎤 Singer Explorer

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

**Singer Explorer** is a sleek Flutter mobile application designed as an encyclopedia for popular music artists. Inspired by modern, clean encyclopedia and card-based UI designs, the app lets users discover singer profiles, read biographies, browse popular songs, and manage their favorite artists interactively.

---

## ✨ Features

- **📋 Interactive Singer Catalog (Home Page)**
  - Vertically scrollable list of artists with circular profile avatars.
  - Neat rounded genre pill badges.
  - Heart icon on each item to toggle favorite state instantly.
- **🔍 Comprehensive Artist Profile (Detail Page)**
  - High-resolution local profile picture with smooth *Hero transitions*.
  - Clean card displaying vital info: Name, Genre, Birth Date, Nationality, and Active Since.
  - Detailed artist biography.
  - **Popular Songs** section with star icons and rounded list rows.
- **❤️ Favorites Management**
  - Instant favorite toggling from both the Home Page and Detail Page.
  - Fully synchronized state across all views.
  - App bar favorite filter button to quickly view only favorited artists.
- **📱 Clean & Responsive UI**
  - Built with Flutter Material 3 guidelines: subtle borders, pastel badges, and minimal shadows.
  - Smooth scrolling and adaptive layout across various screen sizes.

---

## 🌟 Featured Artists

The app includes static curated profiles for 8 popular artists:

1. **Sabrina Carpenter** — *Pop*
2. **Taylor Swift** — *Pop*
3. **Olivia Rodrigo** — *Pop / Alternative*
4. **Drake** — *Hip-Hop / R&B*
5. **The Weeknd** — *R&B / Pop*
6. **Kanye West** — *Hip-Hop / Rap*
7. **Malcolm Todd** — *Indie Pop / Alternative*
8. **Rex Orange County** — *Indie Pop / Alternative*

---

## 📁 Project Structure

```text
singer_explorer/
├── assets/                  # Local artist portrait images (.jpeg)
├── lib/
│   ├── data/
│   │   └── singers.dart     # Static data & biographies for the 8 singers
│   ├── models/
│   │   └── singer.dart      # Singer data model
│   ├── pages/
│   │   ├── home_page.dart   # Main catalog page with favorites filter
│   │   └── detail_page.dart # Singer profile & popular songs detail page
│   ├── widgets/
│   │   └── singer_card.dart # Reusable singer list item card
│   └── main.dart            # Application entry point & theme configuration
├── test/
│   └── widget_test.dart     # Widget tests & asset integrity verification
├── pubspec.yaml             # Dependencies and asset declarations
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.12.0 or higher)
- Dart SDK (bundled with Flutter)
- Android Studio / VS Code with Flutter and Dart extensions
- Android Emulator / iOS Simulator / Physical device with USB Debugging enabled

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/singer-explorer.git
   cd singer-explorer
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🧪 Testing

To run the automated test suite and static code analysis:

```bash
# Run code analysis
flutter analyze

# Run unit & widget tests
flutter test
```

---

## 🛠️ Built With

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: Clean standard Flutter stateful management

---

## 📄 License

This project is created for educational and portfolio purposes. Distributed under the [MIT](LICENSE) License.
