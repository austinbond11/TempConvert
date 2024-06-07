//
//  ContentView.swift
//  TempConvert
//
//  Created by Austin Bond on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    
    // Input number for conversion
    @State private var inputNumberDouble = 0.0
    
    // Selected unit for conversion from
    @State private var firstUnit = "Celsius"
    
    // Selected unit for conversion to
    @State private var secondUnit = "Celsius"
    
    // Result after conversion
    @State private var finalOutputDouble = 0.0
    
    // List of temperature units available for conversion
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]

    // Function to perform the conversion based on selected units
    func calculateConversion() {
        if firstUnit == "Celsius" && secondUnit == "Celsius" {
            finalOutputDouble = inputNumberDouble
        } else if firstUnit == "Celsius" && secondUnit == "Fahrenheit" {
            finalOutputDouble = (inputNumberDouble * 9) / 5 + 32
        } else if firstUnit == "Celsius" && secondUnit == "Kelvin" {
            finalOutputDouble = (inputNumberDouble + 273.15)
        } else if firstUnit == "Fahrenheit" && secondUnit == "Celsius" {
            finalOutputDouble = (inputNumberDouble - 32) * 5 / 9
        } else if firstUnit == "Fahrenheit" && secondUnit == "Kelvin" {
            finalOutputDouble = (inputNumberDouble - 32) * 5 / 9 + 273.15
        } else if firstUnit == "Kelvin" && secondUnit == "Fahrenheit" {
            finalOutputDouble = (inputNumberDouble - 273.15) * 9 / 5 + 32
        } else if firstUnit == "Kelvin" && secondUnit == "Celsius" {
            finalOutputDouble = (inputNumberDouble - 273.15)
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                // Section for input amount
                Section("Amount") {
                    TextField("Amount", value: $inputNumberDouble, format: .number)
                        .keyboardType(.decimalPad) // Set keyboard type to decimal pad
                        .onChange(of: inputNumberDouble) { // Trigger conversion when input changes
                            calculateConversion()
                        }
                }
                
                // Section for selecting the unit to convert from
                Section("Convert from?") {
                    Picker("First Unit", selection: $firstUnit) {
                        ForEach(tempUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: firstUnit) { // Trigger conversion when selection changes
                        calculateConversion()
                    }
                }
                
                // Section for selecting the unit to convert to
                Section("Convert to?") {
                    Picker("First Unit", selection: $secondUnit) {
                        ForEach(tempUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: secondUnit) { // Trigger conversion when selection changes
                        calculateConversion()
                    }
                }
                
                // Section displaying the result of the conversion
                Section("After conversion") {
                    Text("\(finalOutputDouble, specifier: "%.2f")")
                }
            }
            .navigationTitle("Temp Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
