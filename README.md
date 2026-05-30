# Tilawah App

A Flutter-based Quran audio player application that allows users to search Surahs and listen to Quran recitations. The application provides audio playback controls, progress tracking, and seeking functionality using a clean and modular architecture.

![Home](assets/prototype/home_page.jpg)

## Features

* Search Surah by name
* Search Reciter (Qari) by name
* Play Quran audio
* Pause and Resume playback
* Audio progress tracking
* Seek audio position using slider
* Display current playback position
* Display total audio duration
* Current Ayah indicator
* Responsive and simple user interface

## Tech Stack

### Framework

* Flutter

### State Management

* GetX

### Audio Player

* just_audio

### Networking

* Dio

### API

* AlQuran Cloud API

## Project Structure

```text
lib/
├── app/
├── config/
├── features/
│   └── play_audio/
│       ├── data/
│       │   ├── datasource/
│       │   ├── model/
│       │   └── repository/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repository/
│       │   └── usecase/
│       │
│       └── presentation/
│           ├── getx/
│           ├── pages/
│           └── widgets/
├── shared/
```

## Architecture

This project uses a feature-based architecture, where application modules are organized by feature to improve maintainability, scalability, and separation of concerns.

### Data Layer

Responsible for:

* API communication
* Model mapping
* Repository implementation

### Domain Layer

Responsible for:

* Business entities
* Repository contracts
* Use cases

### Presentation Layer

Responsible for:

* UI components
* State management using GetX
* User interactions

## Screenshots

### Home Screen

![Home](assets/prototype/home_page.jpg)

### Search Result

![Search](assets/prototype/filter_by_surah.jpg)

### Audio Playback

![Player](assets/prototype/surah_list.jpg)

## Screen Recording

For more detailed documentation, including application screenshots and demo videos, please visit: [gdrive](https://drive.google.com/drive/folders/1B1-dO2pF0x0ZYvtELtlbryHGLXNsgFdX?usp=sharing).

## Getting Started

### Clone Repository

```bash
git clone https://github.com/Sidqii/tilawah-audio-player.git
```

### Install Dependencies

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

## Dependencies

```yaml
get: ^4.7.3
dio: ^5.9.2
just_audio: ^0.10.5
flutter_launcher_icons: ^0.14.4
```

## Author

Developed as part of a Flutter Mobile Developer Technical Test.
