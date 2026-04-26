# CineScope App

CineScope is a Flutter application for exploring movies and TV shows with a polished dark UI, local auth flow, smart search, detailed media pages, and a per-user watchlist experience.

The app uses TMDB for media data, `flutter_bloc` for state management, `Dio + Retrofit` for networking, `GetIt` for dependency injection, and `Hive` for local persistence.

---

## Overview

The app is built around four main flows: browsing trending and top content, searching across movies and TV shows, saving titles to a personal watchlist, and managing a local signed-in session. It combines remote media data from TMDB with local persistence for auth, watchlist, and recent searches.

---

## Current Features

- Browse trending, popular, and top-rated movies or TV shows.
- Switch between movie and TV content from the home experience.
- Open a detailed media page with overview, reviews, and cast tabs.
- Add and remove titles from a personal watchlist.
- Search across multiple media types using TMDB multi-search.
- Debounced search input for smoother UX.
- Genre-based discovery from the search screen.
- Recent searches history stored locally with quick re-run support.
- Local login and registration flow with persisted session.
- Profile screen showing signed-in user info and watchlist stats.
- Retryable error states, loading shimmers, cached images, and smooth transitions.
- Infinite scrolling for popular content and paginated review loading.

---

## Current App Flow

1. The app checks whether there is an active local session.
2. Unauthenticated users start at the login screen.
3. After login or registration, users enter the main layout.
4. The bottom navigation provides `Home`, `Search`, `Watchlist`, and `Profile`.
5. Watchlist data is scoped per signed-in user and stored locally in Hive.

---

## Screens Included

- Login screen
- Register screen
- Home screen
- Search screen
- Details screen
- Watchlist screen
- Profile screen

---

## Authentication

Authentication in the current project is local and demo-oriented. It does not connect to a remote auth backend.

- Registered users are stored in the Hive `auth` box.
- The active session is also stored locally.
- A seed demo account is created automatically on first launch.

Demo credentials:

- Email: `test@test.com`
- Password: `123456`

Users can also create a new account from the registration screen, and the session is saved automatically.

---

## Screens And Modules

- `auth`: login, registration, session persistence.
- `home`: trending, popular, top-rated sections with movie/TV switching.
- `search`: live search, recent searches, genre discovery, pagination.
- `details`: media info, tabs for about/reviews/cast, bookmark action.
- `watch_list`: locally persisted saved titles per user.
- `profile`: current user summary, account info, logout flow.
- `app`: shared layout and bottom navigation state.
- `core`: networking, routing, DI, constants, helpers, reusable widgets.

---

## Architecture

The project follows a feature-first structure with separated UI, logic, data, and shared core utilities.

```text
lib/
|-- app/
|   |-- app_cubit/
|   `-- layout/
|-- core/
|   |-- di/
|   |-- helpers/
|   |-- networking/
|   |-- routing/
|   |-- styles/
|   `-- widgets/
|-- features/
|   |-- auth/
|   |-- details/
|   |-- home/
|   |-- profile/
|   |-- search/
|   `-- watch_list/
|-- cine_scope_app.dart
`-- main.dart
```

Main architectural choices:

- `Cubit` per feature for focused state handling.
- Repository layer between logic and data sources.
- Retrofit-generated API service on top of Dio.
- GetIt registrations centralized in `lib/core/di/dependency_injection.dart`.
- Hive boxes used for auth session, recent searches, and watchlist persistence.

---

## State Management

The app uses `flutter_bloc` with `Cubit` across the main features:

- `AuthCubit`
- `HomeCubit`
- `SearchCubit`
- `MediaDetailsCubit`
- `WatchlistCubit`
- `AppCubit`

Patterns currently used in the codebase:

- Request lifecycle states: `initial`, `loading`, `success`, `error`
- Debounce logic for search typing
- Incremental pagination for popular titles
- Incremental pagination for reviews
- Shared watchlist state injected into details and main layout

---

## Networking

Remote media data is fetched from TMDB using:

- `Dio`
- `Retrofit`
- `json_serializable`
- `pretty_dio_logger`

Implemented endpoints include:

- Trending
- Popular
- Top rated
- Details
- Credits
- Reviews
- Multi-search
- Discover by genre

The authorization token is currently configured in `lib/core/networking/api_constants.dart`.

---

## Data Flow

The project does not use a complex domain layer, but it still follows a clear data flow:

- UI widgets dispatch actions to feature cubits.
- Cubits coordinate loading, pagination, filtering, and request states.
- Repositories isolate API and local-storage access from presentation logic.
- Remote media content comes from TMDB through Retrofit-generated services.
- Local user session, watchlist items, and recent searches are persisted through Hive.

---

## Local Storage

The app uses `Hive` for lightweight local persistence.

Stored locally:

- Active auth session
- Registered demo users
- Recent searches
- Watchlist items

Implementation notes:

- The watchlist is namespaced by `userId`, so each local user gets separate saved titles.
- Recent searches are capped at 10 items.
- Search and auth data remain available between launches on the same device.

---

## Routing

Named route generation is centralized in `lib/core/routing/app_routers.dart`.

Current routes include:

- `loginScreen`
- `registerScreen`
- `appLayout`
- `homeScreen`
- `searchScreen`
- `watchListScreen`
- `detailsScreen`

---

## UI Notes

- Dark cinematic styling.
- Responsive sizing with `flutter_screenutil`.
- Cached network images for posters and backdrops.
- Shimmer placeholders while loading content.
- Custom animated route transitions.
- Empty and error states across major flows.

---

## Dependencies

Main packages used in this project:

- `flutter_bloc`
- `dio`
- `retrofit`
- `json_annotation`
- `json_serializable`
- `get_it`
- `hive`
- `hive_flutter`
- `cached_network_image`
- `flutter_screenutil`
- `flutter_svg`
- `lazy_load_scrollview`
- `shimmer`
- `pretty_dio_logger`
- `flutter_native_splash`

---

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An internet connection for TMDB requests

### Run The App

```bash
flutter pub get
flutter run
```

### Regenerate Generated Files

If you update Retrofit or JSON model annotations, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Developer Notes

- The app chooses its initial route based on whether a saved local session exists.
- A seeded demo user is created automatically the first time the auth box is initialized.
- Search requests are debounced by `500ms`, and submitted queries are stored in recent history.
- Recent searches are capped at 10 items.
- Popular content supports infinite scroll, while reviews are loaded incrementally inside details.
- Watchlist items are saved with keys prefixed by `userId`, which keeps local users isolated from each other.
- The current widget test is still the default Flutter sample test and should be replaced with real coverage.

---

## Assets

The project currently includes:

- PNG assets for splash screens
- SVG assets for empty and no-results states
- Platform-specific launcher and splash resources

Declared Flutter asset directories:

- `assets/images/png/`
- `assets/images/svg/`

---

## Screenshots

### Home Screen

| Home |
| ---- |
| <img width="1200" alt="home" src="https://github.com/user-attachments/assets/1a94bf01-ad47-4179-ab50-4869e7ce6508" /> |

### Search Screen

| Search | Results |
| ------ | ------- |
| <img width="600" alt="search" src="https://github.com/user-attachments/assets/e6b68d08-a6c9-4d09-a483-d0273eb2b417" /> | <img width="600" alt="search(results)" src="https://github.com/user-attachments/assets/0700fe31-c966-4434-8f6a-e21d80b9e0d3" /> |

### Details And Watchlist

| Details | Watchlist |
| ------- | --------- |
| <img width="600" alt="details" src="https://github.com/user-attachments/assets/026f55d9-b286-408b-a763-dc14350ec3ec" /> | <img width="600" alt="watchList" src="https://github.com/user-attachments/assets/9539d123-9c6e-400c-a6af-f2dcb114450c" /> |

---

## Known Gaps

- The included widget test is still the default Flutter counter test and does not cover the real app.
- Authentication is local/demo auth, not a production backend integration.
- The TMDB token is currently stored directly in source instead of secure environment configuration.
