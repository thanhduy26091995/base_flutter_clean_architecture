# Flutter Clean Architecture with GetX

This is a Flutter project template that follows the Clean Architecture principles and utilizes the GetX package for state management and navigation.

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ensure that you have Flutter and Dart installed on your machine. You can follow the installation instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

### Installing

1. Clone the repository:

    ```bash
    git clone https://github.com/thanhduy26091995/base_flutter_clean_architecture.git
    ```

2. Change to the project directory:

    ```bash
    cd base_flutter_clean_architecture
    ```

3. Get the dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

The app should now be running on your emulator or physical device.

## Project Structure

The project follows the Clean Architecture principles, separating the code into layers:

- **app**: Contains all config, DI, extensions and utils for the app.
- **data**: Contains data sources, repositories, and models.
- **di**: Contains all declaration class of the app
- **domain**: Defines business logic and use cases.
- **network**: Create APIClient class to manage network, using http library.
- **presentation**: Manages the UI and user interaction using the GetX package.

The `lib` directory contains the main application code.

## Features

- **GetX Package**: Utilizes the GetX package for state management, dependency injection, and navigation.
- **Clean Architecture**: Separation of concerns into layers for a scalable and maintainable codebase.

## Usage

Customize the project according to your needs. Add features, modify existing ones, and extend the app based on your requirements.

## Contributing

Feel free to contribute to this project by opening issues or pull requests. Your feedback and contributions are highly appreciated.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt) file for details.

## Acknowledgments

- The project structure and architecture are inspired by Clean Architecture principles and the GetX package.
- Special thanks to the Flutter community for valuable insights and contributions.

