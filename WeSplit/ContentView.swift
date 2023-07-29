//
//  ContentView.swift
//  WeSplit
//
//  Created by Никита Мартьянов on 18.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var check = 0.0
    @State private var people = 2
    @State private var chaev = 20
    @FocusState private var AmountIsFocused : Bool
    let chaevi = [10,15,20,25,0]
    var totalPerPerson: Double {
        let peopleCount = Double(people + 2)
        let chae = Double(chaev)
        let tipValue = check / 100 * chae
        let total = check + chae
        let amountPerPerson = total / peopleCount
        return amountPerPerson
    }
    var total: Double {
        let chae = Double(chaev)
        let totalper = check + chae
        return totalper
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $check, format:.currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($AmountIsFocused)
                    Picker("Количество человек", selection: $people) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    
                    Picker("Процент чаевых", selection:
                            $chaev) {
                        ForEach(chaevi, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                            .pickerStyle(.segmented)
                }
                header : {
                    Text("Какой процент чаевых вы хотите оставить?")
                }
                Section {
                    Text(totalPerPerson,format:.number)
                }
                header : {
                    Text("Сумма на человека")
                }
                Section{
                    Text(total,format:.currency(code: Locale.current.currencyCode ?? "USD"))
                }
                header : {
                    Text("Сумма чека")
                }}
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Готово"){
                        AmountIsFocused = false
                    }
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
