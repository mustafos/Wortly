//
//  AddDurationView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 29.11.2024.
//

import SwiftUI

enum TimeUnit: String, CaseIterable {
    case minutes = "Minutes"
    case hours = "Hours"
}

enum QuantityUnit: String, CaseIterable {
    case cups = "Cups"
    case ounces = "Ounces"
    case grams = "Grams"
    case milliliters = "Milliliters"
    case liters = "Liters"
}

class TimeUnitSelected {}

struct AddDurationView: View {
    @Binding var timeUnit: TimeUnit
    @Binding var timeValue: String
    
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom("Poppins-Regular", size: 17))
                Spacer()
                TextField(text: $timeValue) {
                    Text("20")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                .frame(width: 40)
                Spacer()
                Picker("Select Time Unit", selection: $timeUnit) {
                    ForEach(TimeUnit.allCases, id: \.self) {
                        Text($0.rawValue)
                            .font(.custom("Poppins-Regular", size: 16))
                            .foregroundStyle(.black)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .tint(Color.accentColor)
            }
        }
        .padding()
        .background(.akBg)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}
