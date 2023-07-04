# Weather App

This is a weather app developed using Flutter, a cross-platform framework for building beautiful
mobile applications. The app allows users to get real-time weather information for their current
location.

<p align="center">
  <img src="https://github.com/Sajson/weather_app_flutter/blob/main/assets/APP_DESIGN_1.png?raw=true" height="550px">
</p>
<p align="center">
  <img src="https://github.com/Sajson/weather_app_flutter/blob/main/assets/APP_DESIGN_2.png?raw=true" height="550px">
</p>

## Features

- Current weather information: Users can view the current weather conditions, including temperature,
  humidity, wind speed, and weather description.
- 7-day forecast: The app provides a 7-day weather forecast, allowing users to plan ahead.
- Hourly forecast: Users can view the weather conditions for the next 48 hours.
- Comfort level: The app provides a comfort level based on the current weather conditions.

## Installation

1. Clone the repository

```bash
git clone https://github.com/Sajson/weather_app_flutter.git
```

2. Change the working directory

```bash
cd weather_app_flutter
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the app

```bash
flutter run
```

## API

Api used in this project is [OpenWeatherMap](https://openweathermap.org/api)

## Configuration

To use the app, you need to obtain an API key from a weather data provider. Add your API key in
the `lib/utils/api.dart` file:

```dart

const apiKey = 'YOUR_API_KEY';
```

Replace YOUR_API_KEY with your actual API key.

## Dependencies

The app relies on the following dependencies:

- [http](https://pub.dev/packages/http): A composable, Future-based library for making HTTP
  requests.
- [intl](https://pub.dev/packages/intl): Contains code to deal with internationalized/localized
- [geolocator](https://pub.dev/packages/geolocator): A Flutter geolocation plugin which provides
  easy access to platform-specific location services.
- [geocoding](https://pub.dev/packages/geocoding): A Flutter geocoding plugin which provides
  easy access to platform-specific geocoding services.
- [get](https://pub.dev/packages/get): A Flutter package for navigation that gets rid of the
  boilerplate code.
- [sleek_circular_slider](https://pub.dev/packages/sleek_circular_slider): A Flutter package
  which provides a sleek circular slider.
- [google_fonts](https://pub.dev/packages/google_fonts): A package to include fonts from
  fonts.google.com in your Flutter app.

To install these dependencies, run the following command:

```bash
flutter pub get
```

## Contributing

Contributions are welcome! Feel free to submit a pull request.

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/)

## Acknowledgements

- The app design was inspired by various weather apps available on the market.
- The app icons were downloaded from [icons8](https://icons8.com/icon/set/weather/fluency).
