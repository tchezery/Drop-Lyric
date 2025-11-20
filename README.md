🎵 DropLyric

Learn English through Music & Active Listening

About • Features • Tech Stack • Getting Started • Roadmap

📖 About

DropLyric is a mobile application designed to revolutionize English learning using song lyrics. Unlike traditional karaoke apps, DropLyric employs the Cloze Deletion method (fill-in-the-blanks) to challenge the user's listening skills.

The app intelligently hides words the user has already mastered, replacing them with visual cues (●●●), forcing the learner to rely on audio comprehension rather than reading.

Note: This project is currently in MVP (Minimum Viable Product) stage.

🚀 Key Features

🎧 Active Listening: Practice English by filling in the gaps in real-time.

🙈 Smart Hiding Logic: Words marked as "known" are masked with bullets (●●●) preserving the word length hint.

📱 Cross-Platform Mobile: Built with Flutter for Android (and iOS ready).

🔌 Robust Backend: A .NET 8 Web API serving processed lyrics and metadata.

⚡ Local Integration: Seamless HTTP communication between the Android Emulator and the local C# server.

🛠 Tech Stack

📱 Frontend (Mobile)

Framework: Flutter (Dart)

Networking: HTTP Package

Platform: Android / iOS

⚙️ Backend (API)

Framework: ASP.NET Core (.NET 8)

Language: C#

Docs: Swagger / OpenAPI

📂 Project Structure

The repository is organized as a monorepo:

Drop-Lyric/
├── DropLyric/           # ⚙️ Backend Source Code (.NET API)
│   ├── Controllers/
│   ├── Models/
│   └── Program.cs
│
└── mobile_app/          # 📱 Frontend Source Code (Flutter)
    ├── lib/
    │   └── main.dart
    ├── android/
    └── pubspec.yaml


⚡ Getting Started

Follow these steps to run the project locally.

Prerequisites

.NET 8 SDK

Flutter SDK

Android Studio (with an Emulator configured)

Step 1: Start the Backend ⚙️

Open your terminal in the backend folder:

cd DropLyric


Run the server:

dotnet run


The server will start listening on port 5222.

You can verify it at: http://localhost:5222/Music/lyrics

Step 2: Start the Mobile App 📱

Important: Keep the Backend terminal open!

Launch your Android Emulator via Android Studio.

Open a new terminal in the mobile folder:

cd mobile_app


Run the app:

flutter run


🔮 Roadmap

[x] MVP: Basic communication between Flutter and .NET.

[x] Logic: Cloze deletion algorithm (hiding words).

[ ] Integration: Spotify SDK for real-time audio streaming.

[ ] Database: SQL integration to persist user vocabulary.

[ ] API: Connect to Genius/Musixmatch for dynamic lyrics.

[ ] UX: "Tap to Reveal" functionality.

📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

<sub>Built with for learning purposes.</sub>