//
//  ContentView.swift
//  TimeWarp
//
//  Created by Волошин Нікіта on 30.03.2023.
//



import SwiftUI
import os

let logger = Logger()
// ЛОГЕР

//.onChange(of: selectedTypeOfTimeFrom) { tag in
//    logger.log("selectedTypeOfTimeFrom \(tag)")
//}

enum TimeUnit: String, CaseIterable {
    case seconds
    case minutes
    case hours
    case days
    
    var seconds: Double {
        switch self {
        case .seconds:
            return 1
        case .minutes:
            return 60
        case .hours:
            return 3600
        case .days:
            return 86400
        }
    }
}

struct ContentView: View {
    @FocusState private var amoundIsFocused: Bool // настройка клавы
    
    @State private var selectedTypeOfTimeFrom: TimeUnit = .seconds
    @State private var selectedTypeOfTimeTo: TimeUnit = .seconds
    @State private var inputValue = ""
    
    var convertedValue: Double { // логика конвертации
        let inputValue = Double(self.inputValue) ?? 0
        let inputSeconds = inputValue * selectedTypeOfTimeFrom.seconds
        let outputSeconds = inputSeconds / selectedTypeOfTimeTo.seconds
        return outputSeconds
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Input unit", selection: $selectedTypeOfTimeFrom){
                        ForEach(TimeUnit.allCases, id: \.self){
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle( .wheel)
                    .frame(width: 350, height: 120)
                    
                    TextField("Enter quantity", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .focused($amoundIsFocused)
                }
                header: {Text("Сhoose which type you will convert")}
                
                Section{
                    Picker("Output unit", selection: $selectedTypeOfTimeTo){
                        ForEach(TimeUnit.allCases, id: \.self){
                            Text($0.rawValue)
                        }
                    }
                    .frame(width: 350, height: 160)
                    .pickerStyle( .wheel)
                }
                header: {Text("Choose the type you want to get")}
                
                .toolbar { // способность закрыть клаву
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            amoundIsFocused = false
                        }
                    }
                }
                
                Section{
                    Text("\(convertedValue)")
                }
                header: {Text("Result")}
            }
            .navigationTitle("TimeWrap")
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
