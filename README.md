# CareBuddy — Mobile App

Flutter-based mobile application for CareBuddy, providing a modern **AI-powered voice-first healthcare triage assistant** experience on both Android and iOS with real-time health support, emergency assistance, and intelligent healthcare recommendations.

---

# ✨ Core Features

## 🧠 AI Voice Healthcare Assistant

* Real-time voice conversations with AI
* Symptom-based smart triage
* Natural language understanding
* Multilingual support (English, Korean, Swahili)
* AI-generated medical guidance
* Text-to-speech healthcare responses
* Voice emotion/stress detection

## 🚑 Emergency Assistance

* One-tap SOS emergency button
* Auto-call ambulance/emergency contacts
* Live GPS location sharing
* Emergency nearby hospital navigation
* Emergency medical profile access
* Critical symptom alerts

## 🏥 Smart Hospital Finder

* GPS-based nearby hospitals & clinics
* Live directions using Google Maps
* Hospital ratings & reviews
* Emergency room availability
* Filter by:

  * Distance
  * Specialty
  * Open now
  * Insurance accepted

## 📊 Health Monitoring Dashboard

* Daily health summary
* Symptom tracking charts
* Heart rate integration (wearables)
* Sleep monitoring
* Medication reminders
* Water intake tracking
* Mood & mental wellness tracker

## 💬 Consultation History

* AI consultation transcripts
* Voice recording history
* Saved medical recommendations
* Downloadable consultation reports
* Searchable health history

## 👨‍⚕️ Doctor Connect

* Video consultation booking
* Chat with healthcare professionals
* Appointment scheduling
* Prescription upload & management
* Telemedicine integration

## 🔐 Authentication & Security

* Email/password login
* Google Sign-In
* Apple Sign-In
* Biometric authentication
* Encrypted health records
* Secure cloud synchronization

## 🎨 Modern UI/UX Features

* Dark & Light mode
* Animated onboarding screens
* Smooth voice wave animations
* Glassmorphism modern design
* Accessibility support
* Elder-friendly large text mode
* AI avatar assistant

---

# 🛠 Tech Stack

## Frontend

* **Framework**: Flutter (Dart)
* **Architecture**: Clean Architecture
* **State Management**: Riverpod / Bloc
* **Animations**: Lottie + Flutter Animate
* **Local Storage**: Hive / SharedPreferences

## AI & Voice

* **Speech Recognition**: speech_to_text
* **Voice Playback**: flutter_tts
* **Audio Recording**: flutter_sound
* **AI Integration**: OpenAI / Gemini API

## Maps & Location

* **Maps**: Google Maps Flutter
* **Location**: geolocator
* **Places API**: Google Places API

## Backend & APIs

* **HTTP Client**: Dio
* **Authentication**: Firebase Auth
* **Notifications**: Firebase Cloud Messaging
* **Database**: Firebase / Supabase

## Health & Sensors

* **Wearables**: Google Fit / Apple HealthKit
* **Camera**: image_picker
* **Permissions**: permission_handler

---

# 📂 Enhanced Project Structure

```plaintext
carebuddy-mobile/
├── lib/
│   ├── main.dart
│   │
│   ├── app/
│   │   ├── router/
│   │   ├── theme/
│   │   ├── constants/
│   │   └── config/
│   │
│   ├── core/
│   │   ├── utils/
│   │   ├── errors/
│   │   ├── network/
│   │   └── services/
│   │
│   ├── features/
│   │
│   │   ├── auth/
│   │   │   ├── login/
│   │   │   ├── signup/
│   │   │   ├── forgot_password/
│   │   │   └── biometric/
│   │   │
│   │   ├── onboarding/
│   │   │
│   │   ├── home/
│   │   │   ├── dashboard/
│   │   │   ├── widgets/
│   │   │   └── notifications/
│   │   │
│   │   ├── consultation/
│   │   │   ├── ai_chat/
│   │   │   ├── voice_chat/
│   │   │   ├── symptom_checker/
│   │   │   └── emergency_alert/
│   │   │
│   │   ├── hospital/
│   │   │   ├── map_view/
│   │   │   ├── hospital_details/
│   │   │   └── navigation/
│   │   │
│   │   ├── health_tracker/
│   │   │   ├── medication/
│   │   │   ├── water_tracker/
│   │   │   ├── sleep_tracker/
│   │   │   └── mood_tracker/
│   │   │
│   │   ├── appointments/
│   │   │
│   │   ├── profile/
│   │   │
│   │   ├── settings/
│   │   │
│   │   └── history/
│   │
│   ├── shared/
│   │   ├── widgets/
│   │   ├── models/
│   │   ├── components/
│   │   └── animations/
│   │
│   └── generated/
│
├── assets/
│   ├── images/
│   ├── icons/
│   ├── animations/
│   ├── audio/
│   └── fonts/
│
├── test/
├── integration_test/
├── docs/
├── .env
├── pubspec.yaml
└── README.md
```

---

# 🎯 Key Screens

## 🏠 Home Dashboard

* AI greeting assistant
* Quick symptom check
* Nearby hospitals preview
* Daily health insights
* Medication reminders
* Emergency shortcut

## 🎙 Voice Consultation Screen

* Floating AI assistant avatar
* Animated voice waveform
* Live speech transcription
* AI response cards
* Voice replay option

## 🗺 Hospital Finder Screen

* Interactive Google Maps
* Live hospital markers
* Emergency route navigation
* Hospital detail bottom sheet

## 📈 Health Analytics Screen

* Weekly symptom trends
* Health score indicators
* Mood analytics
* Wellness insights

---

# 🔥 Advanced Features

## 🤖 AI Smart Recommendations

* Suggest hospitals based on symptoms
* Predict possible health risks
* Personalized wellness suggestions
* Smart medication reminders

## 🌐 Offline Support

* Cached consultation history
* Offline emergency access
* Local voice recording storage

## 📱 Smart Notifications

* Medicine reminders
* Appointment alerts
* Hydration reminders
* Emergency health warnings

## 🧩 Accessibility

* Voice-only navigation
* Screen reader support
* High contrast mode
* Large accessibility fonts

---

# 🚀 Getting Started

## Prerequisites

* Flutter SDK 3.19+
* Dart 3.3+
* Android Studio / VS Code
* Xcode (iOS development)

---

# ⚙️ Setup

```bash
# 1. Clone repository
git clone https://github.com/CareBuddy-Chosun/carebuddy-mobile.git

# 2. Open project
cd carebuddy-mobile

# 3. Install dependencies
flutter pub get

# 4. Configure environment variables
cp .env.example .env

# 5. Run the app
flutter run
```

---

# 📦 Recommended Flutter Packages

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod:
  dio:
  google_maps_flutter:
  geolocator:
  speech_to_text:
  flutter_tts:
  flutter_sound:
  firebase_core:
  firebase_auth:
  cloud_firestore:
  firebase_messaging:
  hive:
  lottie:
  flutter_animate:
  permission_handler:
  image_picker:
  cached_network_image:
  intl:
```

---

# 🧪 Testing

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test
```

---

# 🔒 Security Features

* JWT authentication
* API request encryption
* HIPAA-inspired data handling
* Secure token storage
* Biometric login protection

---

# 🌍 Future Improvements

* AI medical image analysis
* Smartwatch integration
* Mental health chatbot
* AR medical guidance
* Blockchain medical records
* AI doctor recommendation engine

---

# 👥 Team

| Name       | Responsibility                                               |
| ---------- | ------------------------------------------------------------ |
| Patience   | Flutter UI/UX, Voice Interaction UX, Health Dashboard Design |
| Jihyuk Lee | App Architecture, API Integration, Backend Connectivity      |

---

# 📌 Vision

CareBuddy aims to make healthcare support more accessible, intelligent, and user-friendly through AI-powered voice interaction, emergency assistance, and smart healthcare recommendations.
