//
//  ContentView.swift
//  Unit Converter
//
//  Created by Reza Gharooni on 16/01/2023.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    @State private var units = ["Length", "Time", "Weight", "Temperature"]
    @State private var selectedUnit = "Length"
    
    @State private var inputLengths = ["kilometers", "feet", "yards", "miles"]
    @State private var selectedInputLength = "kilometers"
    @State private var outputLenghts = ["kilometers", "feet", "yards", "miles"]
    @State private var selectedOutputLength = "miles"
    
    @State private var inputTime = ["seconds", "minutes", "hours", "days"]
    @State private var selectedInputTime = "seconds"
    @State private var outputTime = ["seconds", "minutes", "hours", "days"]
    @State private var selectedOutputTime = "days"
    
    @State private var inputWeight = ["pounds", "ounces", "kilograms"]
    @State private var selectedInputWeight = "pounds"
    @State private var outputWeight = ["pounds", "ounces", "kilograms"]
    @State private var selectedOutputWeight = "kilograms"
    
    @State private var inputTemperature = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInputTemperature = "Celsius"
    @State private var outputTemperature = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedOutputTemperature = "Fahrenheit"
    
    @State private var inputValue = 0.0
    @FocusState private var valueIsFocused: Bool
    
    var convertedLengthValue: Double {
        
        let baseLengthFeet = inputValue * 3280.84
        
        if (selectedInputLength == "kilometers") {
            if (selectedOutputLength == "kilometers") {
                return baseLengthFeet / 3280.84
            } else if (selectedOutputLength == "feet") {
                return baseLengthFeet
            } else if (selectedOutputLength == "yards") {
                return baseLengthFeet / 3
            } else if (selectedOutputLength == "miles") {
                return baseLengthFeet * 0.000189394
            }
        }
        
        if (selectedInputLength == "feet") {
            if (selectedOutputLength == "kilometers") {
                return (baseLengthFeet / 3280.84) / 3280.84
            } else if (selectedOutputLength == "feet") {
                return baseLengthFeet / 3280.84
            } else if (selectedOutputLength == "yards") {
                return (baseLengthFeet / 3280.84) / 3
            } else if (selectedOutputLength == "miles") {
                return (baseLengthFeet / 3280.84) / 5280
            }
        }
        
        if (selectedInputLength == "yards") {
            if (selectedOutputLength == "kilometers") {
                return (baseLengthFeet / 3280.84) / 1094
            } else if (selectedOutputLength == "feet") {
                return (baseLengthFeet / 3280.84) * 3
            } else if (selectedOutputLength == "yards") {
                return (baseLengthFeet / 3280.84)
            } else if (selectedOutputLength == "miles") {
                return (baseLengthFeet / 3280.84) / 1760
            }
        }
        
        if (selectedInputLength == "miles") {
            if (selectedOutputLength == "kilometers") {
                return (baseLengthFeet / 3280.84) * 1.609
            } else if (selectedOutputLength == "feet") {
                return (baseLengthFeet / 3280.84) * 5280
            } else if (selectedOutputLength == "yards") {
                return (baseLengthFeet / 3280.84) * 1760
            } else if (selectedOutputLength == "miles") {
                return (baseLengthFeet / 3280.84)
            }
        }
        return 0.0
    }
    
    var convertedTimeValue: Double {
        let baseTimeSeconds = inputValue
        if (selectedInputTime == "seconds") {
            if (selectedOutputTime == "days") {
                return baseTimeSeconds / 86400
            } else if (selectedOutputTime == "minutes") {
                return baseTimeSeconds / 60
            } else if (selectedOutputTime == "hours") {
                return baseTimeSeconds / 3600
            } else if (selectedOutputTime == "seconds") {
                return baseTimeSeconds
            }
        }
        
        if (selectedInputTime == "minutes") {
            if (selectedOutputTime == "days") {
                return baseTimeSeconds / 1440
            } else if (selectedOutputTime == "minutes") {
                return baseTimeSeconds
            } else if (selectedOutputTime == "hours") {
                return baseTimeSeconds / 60
            } else if (selectedOutputTime == "seconds") {
                return baseTimeSeconds * 60
            }
        }
        
        if (selectedInputTime == "hours") {
            if (selectedOutputTime == "days") {
                return baseTimeSeconds / 24
            } else if (selectedOutputTime == "minutes") {
                return baseTimeSeconds * 60
            } else if (selectedOutputTime == "hours") {
                return baseTimeSeconds
            } else if (selectedOutputTime == "seconds") {
                return baseTimeSeconds * 3600
            }
        }
        
        if (selectedInputTime == "days") {
            if (selectedOutputTime == "days") {
                return baseTimeSeconds
            } else if (selectedOutputTime == "minutes") {
                return baseTimeSeconds * 1440
            } else if (selectedOutputTime == "hours") {
                return baseTimeSeconds * 24
            } else if (selectedOutputTime == "seconds") {
                return baseTimeSeconds * 86400
            }
        }
        return 0.0
    }
    
    var convertedWeightValue: Double {
        let baseWeight = inputValue
        
        if (selectedInputWeight == "pounds") {
            if (selectedOutputWeight == "kilograms") {
                return baseWeight / 2.205
            } else if (selectedOutputWeight == "ounces") {
                return baseWeight * 16
            } else if (selectedOutputWeight == "pounds") {
                return baseWeight
            }
        }
        if (selectedInputWeight == "ounces") {
            if (selectedOutputWeight == "kilograms") {
                return baseWeight / 35.274
            } else if (selectedOutputWeight == "ounces") {
                return baseWeight
            } else if (selectedOutputWeight == "pounds") {
                return baseWeight / 16
            }
        }
        if (selectedInputWeight == "kilograms") {
            if (selectedOutputWeight == "kilograms") {
                return baseWeight
            } else if (selectedOutputWeight == "ounces") {
                return baseWeight * 35.274
            } else if (selectedOutputWeight == "pounds") {
                return baseWeight * 2.205
            }
        }
        return 0.0
    }
    
    var convertedTemperatureValue: Double {
        let baseTemp = inputValue
        
        if (selectedInputTemperature == "Celsius") {
            if (selectedOutputTemperature == "Celsius") {
                return baseTemp
            } else if (selectedOutputTemperature == "Fahrenheit") {
                return (baseTemp * (9/5)) + 32
            } else if (selectedOutputTemperature == "Kelvin") {
                return baseTemp + 273.15
            }
        }
        if (selectedInputTemperature == "Fahrenheit") {
            if (selectedOutputTemperature == "Celsius") {
                return ((baseTemp - 32) * (5 / 9))
            } else if (selectedOutputTemperature == "Fahrenheit") {
                return baseTemp
            } else if (selectedOutputTemperature == "Kelvin") {
                return ((baseTemp - 32) * (5 / 9)) + 273.15
            }
        }
        
        if (selectedInputTemperature == "Kelvin") {
            if (selectedOutputTemperature == "Celsius") {
                return baseTemp - 273.5
            } else if (selectedOutputTemperature == "Fahrenheit") {
                return (baseTemp - 273.5) * (9 / 5) + 32
            } else if (selectedOutputTemperature == "Kelvin") {
                return baseTemp
            }
        }
        
        return 0.0
    }

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Unit", selection: $selectedUnit) {
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                        
                }header: {
                    Text("Pick a Unit you want to convert")
                }
                
                Section {
                    if (selectedUnit == "Length") {
                        Picker("Input Measurement", selection: $selectedInputLength){
                            ForEach(inputLengths, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else if (selectedUnit == "Time") {
                        Picker("Input Measurement", selection: $selectedInputTime){
                            ForEach(inputTime, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else if (selectedUnit == "Weight") {
                        Picker("Input Measurement", selection: $selectedInputWeight){
                            ForEach(inputWeight, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else {
                        Picker("Input Measurement", selection: $selectedInputTemperature){
                            ForEach(inputTemperature, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    }
                }header: {
                    Text("Input measurement")
                }
                
                Section {
                    if (selectedUnit == "Length") {
                        Picker("Output Measurement", selection: $selectedOutputLength){
                            ForEach(outputLenghts, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else if (selectedUnit == "Time") {
                        Picker("Output Measurement", selection: $selectedOutputTime){
                            ForEach(outputTime, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else if (selectedUnit == "Weight") {
                        Picker("Output Measurement", selection: $selectedOutputWeight){
                            ForEach(outputWeight, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    } else {
                        Picker("Output Measurement", selection: $selectedOutputTemperature){
                            ForEach(outputTemperature, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    }
                }header: {
                    Text("Output measurement")
                }
                
                Section {
                    TextField("Value", value: $inputValue, format: .number) .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                }header: {
                    Text("Input Value")
                }
                
                Section {
                    if (selectedUnit == "Length") {
                        Text("\(convertedLengthValue, specifier: "%.1f")")
                    } else if (selectedUnit == "Time"){
                        Text("\(convertedTimeValue, specifier: "%.1f")")
                    } else if (selectedUnit == "Weight"){
                        Text("\(convertedWeightValue, specifier: "%.1f")")
                    } else if (selectedUnit == "Temperature"){
                        Text("\(convertedTemperatureValue, specifier: "%.1f")")
                    }
                }header: {
                    Text("Output Value")
                }
                
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                        
                    }
                }
            }
            .adaptsToKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct AdaptsToKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.currentHeight)
                .onAppear(perform: {
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
                        .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
                        .compactMap { notification in
                            withAnimation(.easeOut(duration: 0.16)) {
                                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                            }
                    }
                    .map { rect in
                        rect.height - geometry.safeAreaInsets.bottom
                    }
                    .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                    
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
                        .compactMap { notification in
                            CGFloat.zero
                    }
                    .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                })
        }
    }
}

extension View {
    func adaptsToKeyboard() -> some View {
        return modifier(AdaptsToKeyboard())
    }
}
