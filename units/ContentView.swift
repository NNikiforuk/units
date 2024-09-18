//
//  ContentView.swift
//  units
//
//  Created by Natalia Nikiforuk on 18/09/2024.
//


import SwiftUI

struct ContentView: View {
    @State private var unitFrom = "m"
    @State private var unitTo = "m"
    @State private var amount = 0.0
    
    let units = ["m", "km"]
    
    var changingUnits: Double {
        var result: Double = 0.0
        
        if (unitFrom == unitTo) {
            result = amount
        }
        
        if unitFrom == "m" && unitTo == "km" {
            result = amount / 1000
        } else if (unitFrom == "km" && unitTo == "m") {
            result = amount * 1000
        }
        
        return result
    }
    
    var body: some View {
        Form {
            Section("Changing from:") {
                Picker("Changing from:", selection: $unitFrom) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Changing to:") {
                    Picker("To:", selection: $unitTo) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            
            Section("Value:") {
                TextField("Value", value: $amount, format: .number)
            }
            
            Section {
                Text(changingUnits, format: .number)
            }
            
            }
    }
}

#Preview {
    ContentView()
}
