Flutter Product List with Clean Architecture and Bloc
A Flutter application implementing an infinite scrolling list of products fetched from the DummyJSON Products API, with search functionality and a favorite feature using Clean Architecture and Bloc for state management.
Features

Infinite Scrolling: Loads 20 products at a time when scrolling to the bottom.
Search: Search products by name with a 500ms debounce to limit API calls.
Favorites: Toggle favorite products, stored locally using Hive.
Error Handling: Displays messages for no internet, failed API calls, no data, or end of list.
Smooth Scrolling: Uses ListView.builder and cached_network_image for performance.
Clean Architecture: Organized into Presentation, Domain, and Data layers.
Bloc: Manages state using events and states.

Prerequisites

Flutter SDK (version 2.12.0 or higher)
Dart
An IDE (e.g., VS Code, Android Studio)
Internet connection for API calls

Setup Instructions

Clone the Repository:
git clone https://github.com/HoaiNam0107/hoainam_BurningBros.git
cd burning_test


Install Dependencies:
flutter pub get


Generate JSON Serialization Files:
flutter pub run build_runner build

for ios:
cd ios
pod install
open Runner.xcworkspace

Run the App:
flutter run



Testing

Infinite Scrolling: Scroll to the bottom to load more products.
Search: Type in the search bar to filter products by name.
Favorites: Tap the heart icon to add/remove products from favorites.
Error Handling: Disconnect from the internet to see the "No internet connection" message.

Project Structure

data/: Contains data sources (API, Hive) and repositories.
domain/: Contains entities, use cases, and repository interfaces.
presentation/: Contains UI (screens) and Bloc for state management.

Dependencies

http: For API calls
json_serializable: For JSON serialization
hive and hive_flutter: For local storage
flutter_bloc: For state management
connectivity_plus: For checking internet connectivity
cached_network_image: For efficient image loading
equatable: For comparing objects

Notes

The app uses the DummyJSON API (https://dummyjson.com/products).
Search is debounced by 500ms to prevent excessive API calls.
Favorites are stored in a Hive box named favorites.
Clean Architecture ensures maintainability and scalability.

