# Product Management App

This is a Flutter-based mobile application that allows users to manage a list of products. Users can create, delete, view all products, and search for specific products in real time. The application also includes a logout functionality and uses Shared Preferences for persistent storage.

## Features

1. **Create Products**

    - Users can add new products by providing the product details.

2. **Delete Products**

    - Users can delete any product from the list by tapping on the delete button.

3. **View All Products**

    - Displays a list of all created products in a scrollable view.

4. **Search Products**

    - Includes a real-time search feature implemented on a separate screen to quickly find products.

5. **Persistent Storage**

    - The list of products is saved in Shared Preferences to ensure the data persists even after the app is closed.

6. **Logout Functionality**

    - A logout button is provided below the product list to allow users to log out of the application.

## Installation and Setup

### Prerequisites

- Flutter SDK installed
- Dart enabled IDE (e.g., Android Studio, Visual Studio Code)
- Device/emulator to run the application

### Steps to Run the Application

1. Clone the repository.
2. Navigate to the project directory.
3. Install dependencies.
4. Run the application.

## How It Works

### Main Features

1. **Create Products:**

    - Navigate to the product creation screen using a floating action button.
    - Enter product details and tap "Add Product" to save the product.

2. **Delete Products:**

    - On the main product list, swipe or tap a delete button next to a product to remove it.

3. **View Products:**

    - The main screen displays a list of all added products in a card format.

4. **Search Products:**

    - Navigate to the search screen via the search icon on the app bar.
    - Start typing in the search bar for real-time product filtering.

5. **Logout Button:**

    - Located at the bottom of the main product list.
    - Tapping it will log out the user and redirect them to the login screen.

6. **Persistent Storage:**

    - Products are stored in Shared Preferences as JSON, ensuring they remain saved even when the app is closed.

## Future Improvements

1. User authentication for better security.
2. Enhanced product details (e.g., adding images or categories).
3. Support for product sorting and filtering.
4. Integration with a cloud database for centralized storage.

## Author

Aashish Kumar\
[LinkedIn](https://linkedin.com/in/aashish05kumar) | [GitHub](https://github.com/strikleApp)