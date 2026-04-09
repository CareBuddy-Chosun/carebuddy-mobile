# CareBuddy — Mobile App

Flutter-based mobile application for CareBuddy, providing a voice-first healthcare triage assistant experience on iOS and Android.

## Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: TBD (Riverpod / Bloc)
- **Voice**: flutter_sound / speech_to_text
- **Maps**: Google Maps Flutter
- **HTTP**: Dio

## Project Structure

```
carebuddy-mobile/
├── lib/
│   ├── main.dart
│   ├── app/                # App-level config, routing, theme
│   ├── features/
│   │   ├── auth/           # Login / signup screens
│   │   ├── home/           # Home screen
│   │   ├── consultation/   # Voice-first triage chat screen
│   │   ├── history/        # Session history
│   │   ├── hospital/       # GPS-based hospital finder
│   │   └── profile/        # User profile & settings
│   ├── shared/
│   │   ├── widgets/        # Reusable UI components
│   │   ├── models/         # Data models
│   │   └── services/       # API client, location, audio
│   └── core/               # Constants, theme, utils
├── assets/
│   ├── images/
│   └── audio/
├── test/
└── pubspec.yaml
```

## Getting Started

### Prerequisites
- Flutter SDK 3.19+
- Dart 3.3+
- Android Studio / Xcode (for device emulation)

### Setup

```bash
# 1. Clone the repo
git clone https://github.com/CareBuddy-Chosun/carebuddy-mobile.git
cd carebuddy-mobile

# 2. Install dependencies
flutter pub get

# 3. Set up environment variables
cp .env.example .env
# Edit .env with your backend URL and API keys

# 4. Run the app
flutter run
```

### Running Tests

```bash
flutter test
```

## Backend

This app connects to [carebuddy-backend](https://github.com/CareBuddy-Chosun/carebuddy-backend).
Set the backend URL in your `.env` file.

## Team

| Name | Responsibility |
|------|----------------|
| Patience | Flutter UI/UX, voice interaction UX |
| Jihyuk Lee | App architecture, API integration |
