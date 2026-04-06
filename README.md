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
| <img width="1200" alt="home" src="https://github.com/user-attachments/assets/1a94bf01-ad47-4179-ab50-4869e7ce6508" />
 |

### Search Screen

| Search           | Results          |
| ---------------- | ---------------- |
| <img width="600" alt="search" src="https://github.com/user-attachments/assets/e6b68d08-a6c9-4d09-a483-d0273eb2b417" />
 | <img width="600" alt="search(results)" src="https://github.com/user-attachments/assets/0700fe31-c966-4434-8f6a-e21d80b9e0d3" />
 |

### Details Screen

| Details               |
| --------------------- |
| <img width="1200" alt="details" src="https://github.com/user-attachments/assets/026f55d9-b286-408b-a763-dc14350ec3ec" />
 |

### Watchlist Screen

| Watchlist             |
| --------------------- |
|  <img width="1200" alt="watchList" src="https://github.com/user-attachments/assets/9539d123-9c6e-400c-a6af-f2dcb114450c" />
|

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
