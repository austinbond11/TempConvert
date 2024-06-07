# TempConverter

TempConverter is a simple iOS application that provides unit conversion between different temperature scales: Celsius, Fahrenheit, and Kelvin. This app offers an intuitive UI and real-time conversion results to make temperature conversions quick and easy.

## Author
Created by [austinbond11](https://github.com/austinbond11)

## Features

-  Convert temperatures between Celsius, Fahrenheit, and Kelvin.
-  Real-time conversion as you type.
-  Simple and intuitive user interface.
-  Supports decimal input for precise conversions.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/austinbond11/TempConverter.git
    ```

2. Open the Xcode project:

    ```bash
    cd TempConverter
    open TempConverter.xcodeproj
    ```

3. Build and run the project in Xcode.

## Usage

-  Enter the temperature value in the text field under "Amount".
-  Select the unit you are converting from using the "Convert from?" segmented control.
-  Select the unit you are converting to using the "Convert to?" segmented control.
-  The converted value will be displayed under "After conversion".

## Code Overview

### ContentView.swift

This file contains the main view of the application. It includes:

-  State variables for input temperature, selected units, and conversion result.
-  A function, `calculateConversion()`, to perform the conversions.
-  UI elements such as `Form`, `TextField`, and `Picker` for user input and selection.
