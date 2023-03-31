//
//  ContentView.swift
//  TimeWarp
//
//  Created by Волошин Нікіта on 30.03.2023.

//

//

import SwiftUI



struct ContentView: View {
    
    @State private var typesOfTime = ["second", "minutes", "hours", "days"]
    @State private var inputAmount = ""
    
    
    var body: some View {
            Form{
                Section{ //выбор входного значения + текстовое поле для ввода
                    Picker("", selection: $typesOfTime){
                        ForEach(typesOfTime, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 350, height: 140)
                    TextField("Enter quantity", text: $inputAmount)
                }
            header: {Text("Сhoose which type you will convert")}  // название
                    .navigationTitle("TimeWrap")
                    .padding(.top)
                
                
                Section{ // выбор выходного значения
                    Picker("", selection: $typesOfTime){
                        ForEach(typesOfTime, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 350, height: 170)
                }
            header: {Text("Choose the type you want to get")}
                
                Section{
                    Text("")
                } header: {Text("Your result in:")}
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
