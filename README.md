#📌 README for Shopping Cart App (Flutter + BLoC)
A scalable e-commerce catalog app built with Flutter and BLoC, featuring pagination, state management, and a shopping cart. 🚀




##📌 Features
✅ Product Listing - Displays a paginated list of products using GridView.
✅ Pagination - Implements infinite scrolling using ScrollController with API support.
✅ Shopping Cart - Users can add, update, and remove items from the cart.
✅ Dynamic Cart Badge - Shows the total number of items in the cart.
✅ State Management - Utilizes flutter_bloc for efficient state handling.
✅ REST API Integration - Fetches products from DummyJSON API.
✅ Error Handling - Displays errors if API requests fail.
✅ UI & UX Improvements - Uses responsive layouts and loading indicators for a smooth experience.

##📌 Installation & Setup

🔹 Prerequisites
Ensure you have:

Flutter >=3.10

Dart >=2.18

Android Studio / VS Code

Emulator or Physical Device

🔹 Clone the Repository
```
sh
Copy
Edit
git clone https://github.com/yourusername/shopping-cart-app.git
cd shopping-cart-app
```
🔹 Install Dependencies
```
sh
Copy
Edit
flutter pub get
```
🔹 Run the App
```
sh
Copy
Edit
flutter run
```
##📌 Project Structure
```
css
Copy
Edit
lib/
│
├── core/
│   ├── constants/
│   │   └── app_strings.dart
│   ├── theme/
│   │   └── app_theme.dart
│
├── data/
│   ├── models/
│   │   └── product_model.dart
│   ├── fetch/
│   │   └── product_fetch.dart
│
├── presentation/
│   ├── bloc/
│   │   ├── product/
│   │   │   ├── product_bloc.dart
│   │   │   ├── product_event.dart
│   │   │   └── product_state.dart
│   │   ├── cart/
│   │   │   ├── cart_bloc.dart
│   │   │   ├── cart_event.dart
│   │   │   └── cart_state.dart
│   ├── pages/
│   │   ├── catelogue_page.dart
│   │   ├── cart_page.dart
│
└── main.dart
```
##📌 API Used
This app fetches products from DummyJSON API.
Example API Request:

```
sh
Copy
Edit
GET https://dummyjson.com/products?limit=10&skip=0
```
Example Response:

```
json
Copy
Edit
{
  "products": [
    {
      "id": 1,
      "title": "iPhone 9",
      "brand": "Apple",
      "price": 549,
      "discountPercentage": 12.96,
      "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
    }
  ]
}
```
##📌 How Pagination Works
1️⃣ User scrolls down → _scrollController detects scroll end.
2️⃣ BLoC event is triggered → Calls LoadProducts(page: _currentPage).
3️⃣ API fetches new products → Products are appended to the list.
4️⃣ Stops fetching when API returns empty → _hasMore = false.

##📌 Future Improvements
🔹 Add Search & Filters - Implement category filtering and a search bar.
🔹 Offline Support - Cache product data for better user experience.
🔹 User Authentication - Implement sign-in and user-specific cart management.
🔹 Checkout & Payments - Add a secure payment gateway integration.

##📌 Credits
🛠️ Built with Flutter & BLoC
💡 API: DummyJSON
👨‍💻 Developed by: Sumit Kamble
