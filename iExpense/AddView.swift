//
//  AddView.swift
//  iExpense
//
//  Created by Baymurat Abdumuratov on 29/02/24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var type = "Personal"
    @State private var amount = Double()
    @State public var currency = "$"
    @State private var title = "Default"
    
    var items: [ExpenseItem]
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                    
                }
                HStack(spacing: 0){
                    Text(currency)
                        .contextMenu(ContextMenu(menuItems: {
                            Button("USD"){
                                currency = "$"
                            }
                            Button("EURO"){
                                currency = "€"
                            }
                            Button("GBP"){
                                currency = "£"
                            }
                            
                        }))
                    
                    TextField("Amount", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button("Save"){
                    
                    //Here we are saving the data using SwiftData!!!
                    
                    let item = ExpenseItem(name: title, type: type, amount: amount, currency: currency)
                    modelContext.insert(item)
                    dismiss()
                }
            })
            .navigationBarBackButtonHidden()
        }
    }
    
}



#Preview {
    AddView( items: [ExpenseItem(name: "Someone", type: "Personal", amount: 0, currency: "USD")])
}
