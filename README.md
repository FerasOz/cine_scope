# 🎬 CineScope App

A modern and scalable **Movies & TV Shows** application built with **Flutter** and **Bloc (Cubit)**, designed to provide a smooth and engaging experience for discovering, searching, and saving media content.

---

## Features

* Browse:

  * Trending movies & TV shows
  * Popular content
  * Top-rated media
* Powerful search system:

  * Real-time search with debounce
  * Recent searches history
  * Genre-based discovery
* Detailed media screen:

  * Overview
  * Rating
  * Cast & credits
  * Reviews
* Add/remove items to **Watchlist**
* Local persistence using **Hive**
* Pagination (infinite scrolling)
* Error handling with retry mechanism
* Clean and responsive UI
* Optimized image loading with caching

---

## Screenshots

### Home Screen

| Home                  |
| --------------------- |
| *Add Screenshot Here* |

### Search Screen

| Search           | Results          |
| ---------------- | ---------------- |
| *Add Screenshot* | *Add Screenshot* |

### Details Screen

| Details               |
| --------------------- |
| *Add Screenshot Here* |

### Watchlist Screen

| Watchlist             |
| --------------------- |
| *Add Screenshot Here* |

---

## Architecture

The project follows a **clean and scalable architecture** using feature-based structure:

```
lib/
│
├── core/              # Constants, networking, DI, helpers
├── app/               # App layout & global cubits
├── features/
│   ├── home/
│   ├── details/
│   ├── search/
│   └── watch_list/
```

* Separation of concerns between layers
* Each feature is isolated and modular
* Reusable widgets and clean structure

---

## State Management

* Uses **flutter_bloc (Cubit)**
* Clear states:

  * Initial
  * Loading
  * Success
  * Error
* Debounce handling for search input
* Efficient pagination logic

---

## Networking

* Uses **Dio** for API requests
* **Retrofit** for API generation
* Clean API layer abstraction
* Error handling integrated with UI

---

## Local Storage

* Uses **Hive** for storing:

  * Watchlist
  * Recent searches

Benefits:

* Fast performance
* Offline support
* Lightweight and efficient

---

## Dependency Injection

* Uses **GetIt**
* Centralized dependency management
* Easy scalability and testing

---

## UI & UX

* Clean dark-themed UI
* Smooth scrolling with pagination
* Cached images for better performance
* Search UX improvements:

  * Debounce input
  * Save only intentional searches
* Clear empty & error states

---

## Getting Started

### Prerequisites

* Flutter SDK (latest stable)
* Dart SDK

### Installation

```bash
git clone https://github.com/your-username/cine_scope.git
cd cine_scope
flutter pub get
flutter run
```

---

## Dependencies

* flutter_bloc
* dio
* retrofit
* get_it
* hive
* cached_network_image
* flutter_screenutil

---

## Future Improvements

* Smart recommendations system
* Multi-language support
* Notifications
* Advanced animations
* User authentication

---

## Author

**Feras Osama Abuzayed**
