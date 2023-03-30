//
//  ContentView.swift
//  TimeWarp
//
//  Created by Волошин Нікіта on 30.03.2023.

//      Преобразование времени: пользователи выбирают секунды, минуты, часы или дни.

//

import SwiftUI



struct ContentView: View {
    
    @State private var typesOfTime = ["second", "minutes", "hours", "days"]
    @State private var inputAmount = ""
    
    
    var body: some View {
        NavigationView{
            Form{
                
                
                Section{ //выбор входного значения + текстовое поле для ввода
                    Picker("", selection: $typesOfTime){
                        ForEach(typesOfTime, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Enter quantity", text: $inputAmount)
                }
            header: {Text("Сhoose which type you will convert")}  // название
                    .navigationTitle("TimeWrap")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
