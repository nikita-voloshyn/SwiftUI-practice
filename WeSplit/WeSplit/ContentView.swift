//
//  ContentView.swift
//  WeSplit
//
//  Created by Волошин Нікіта on 29.03.2023.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amoundIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [5, 10, 15, 20, 0]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue  = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View{
        NavigationView{
            Form {
                    Section{ //Количество людей и размер чека
                        TextField("Amound", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amoundIsFocused)
                        
                        Picker("Number of people", selection: $numberOfPeople){ // количество людей
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section { // процент чаевых на выбор
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                    .navigationTitle("WeSplit")// заголовок
                    
                    .toolbar { // способность закрыть клаву
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            
                            Button("Done") {
                                amoundIsFocused = false
                            }
                        }
                    }
                    
                    Section{ // финальная сумма с учетом чаевых
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    } header: {
                        Text("Amount per person")
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

