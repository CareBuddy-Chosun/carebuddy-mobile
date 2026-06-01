# CareBuddy — Mobile App

Flutter-based mobile application for CareBuddy, providing a **voice-first AI healthcare triage assistant** experience on Android and iOS — symptom triage through natural voice conversation, emergency guidance, and GPS-based hospital discovery.

> **Status:** Active development. The sections below separate what is **implemented today** from what is **planned** on the roadmap, so contributors and users aren't misled about current capabilities.

---

# ✨ Features (Implemented)

These features exist in the current codebase (`lib/features/`).

## 🧠 AI Voice Triage Assistant
* Voice-first conversation flow (speech-to-text input)
* Symptom-based triage recommendations
* Korean & English support
* Text-to-speech playback of AI responses (on-device, free)

## 🚑 Emergency Guidance
* Emergency keyword detection during conversation
* Clear "call 119 / go to the ER" guidance for critical symptoms

## 🏥 Hospital Finder
* GPS-based nearby hospital lookup
* Google Maps integration for directions

## 💬 Consultation History
* Past consultation sessions and transcripts
* Triage results per session

## 🔐 Authentication
* Email / password login & signup
* Secure token storage (`flutter_secure_storage`)

## 👤 Profile
* User profile and basic settings

---

# 🗺 Roadmap (Planned / Not Yet Implemented)

These are planned directions. They are **not** in the app yet — listed here so the vision is clear without implying they already work.

* **Health Monitoring** — daily summary, symptom charts, heart-rate/sleep tracking via wearables (Google Fit / Apple HealthKit), medication & water reminders, mood tracker
* **Doctor Connect** — video consultation booking, chat with professionals, appointment scheduling, prescription management, telemedicine
* **Expanded Auth** — Google / Apple Sign-In, biometric authentication
* **Offline support** — cached history & offline emergency access
* **Notifications** — medicine / appointment / hydration reminders (FCM)
* **Accessibility** — voice-only navigation, high-contrast & large-text modes, elder-friendly UI
* **AI enhancements** — voice emotion/stress detection, medical image analysis, smart recommendations
* **Additional languages** — e.g. Swahili

---

# 🛠 Tech Stack

## Frontend
* **Framework**: Flutter (Dart)
* **State Management**: Riverpod
* **Routing**: go_router
* **Animations**: Lottie
* **Local Storage**: SharedPreferences, flutter_secure_storage

## AI & Voice
* **Speech Recognition**: speech_to_text
* **Text-to-Speech**: flutter_tts (on-device)
* **Audio Recording**: record / audioplayers
* **LLM**: OpenAI-compatible backend (see [carebuddy-backend](https://github.com/CareBuddy-Chosun/carebuddy-backend))

## Maps & Location
* **Maps**: google_maps_flutter
* **Location**: geolocator
* **Links**: url_launcher

## Networking
* **HTTP Client**: Dio

> Packages above reflect the actual `pubspec.yaml`. Roadmap items (Firebase, Hive, wearables, etc.) are **not** dependencies yet and will be added when those features are built.

---

# 📂 Project Structure

```plaintext
carebuddy-mobile/
├── lib/
│   ├── main.dart
│   ├── app/                # App shell, routing, theme
│   ├── core/               # Constants, network, services, theme
│   ├── features/
│   │   ├── auth/           # Login / signup
│   │   ├── home/           # Home / dashboard
│   │   ├── consultation/   # Voice-first triage chat
│   │   ├── hospital/       # GPS-based hospital finder
│   │   ├── history/        # Session history
│   │   └── profile/        # User profile & settings
│   └── shared/             # Reusable widgets, models
├── assets/
├── test/
└── pubspec.yaml
```

---

# 🚀 Getting Started

## Prerequisites
* Flutter SDK (see `environment.sdk` in `pubspec.yaml`)
* Android Studio / VS Code
* Xcode (for iOS development)

## Setup

```bash
# 1. Clone the repository
git clone https://github.com/CareBuddy-Chosun/carebuddy-mobile.git
cd carebuddy-mobile

# 2. Install dependencies
flutter pub get

# 3. Configure environment variables
cp .env.example .env
# Edit .env with your backend URL and API keys

# 4. Run the app
flutter run
```

## Testing

```bash
flutter test
```

---

# 🔗 Related

* **Backend**: [carebuddy-backend](https://github.com/CareBuddy-Chosun/carebuddy-backend) — FastAPI triage API, TTS/STT, LLM integration
