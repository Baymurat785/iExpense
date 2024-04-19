//
//  ContentView.swift
//  iExpense
//
//  Created by Baymurat Abdumuratov on 28/02/24.
//

import SwiftUI
import SwiftData

enum ExpenseType: String, CaseIterable {
    case all = "All"
    case personal = "Personal"
    case business = "Business"
}

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    let expenseType: ExpenseType
    @State private var selectedItem = ExpenseType.all
    @Query(sort: \ExpenseItem.amount) var expenses: [ExpenseItem] = []
    
    
    @State private var showingAddExpenses = false
    @State private var color = Color(Color.green)
    
    
    var body: some View {
        NavigationStack {
            
            Picker(selection: $selectedItem) {
                ForEach(ExpenseType.allCases, id: \.self){ option in
                    Text(option.rawValue).tag(option)
                    
                }
            } label: {
                Text("")
            }
            .pickerStyle(.segmented)
            
            
            List {
                if selectedItem == .personal || selectedItem == .all{
                    Section {
                        
                        if expenses.isEmpty{
                            
                        }else{
                            ForEach(expenses){ item in
                                if item.type == "Personal"{
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(item.name)
                                                .font(.headline)
                                                .bold()
                                            Text(item.type)
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                        Text("\(item.currency)\(String(format: "%g", item.amount))")
                                            .foregroundStyle(colortingExpenses(expenseAmount: item.amount))
                                        
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Personal")
                            .font(.title)
                    }
                    
                }
                
                if (selectedItem == .business || selectedItem == .all){
                    Section {
                        ForEach(expenses){ item in
                            if item.type == "Business"{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(item.name)
                                            .font(.headline)
                                            .bold()
                                        Text(item.type)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    Text("\(item.currency)\(String(format: "%g", item.amount))")
                                        .foregroundStyle(colortingExpenses(expenseAmount: item.amount))
                                    
                                }
                                
                            }
                        }
                        .onDelete { IndexSet in
                            //                        removeItems(expense: IndexSet)
                        }
                        
                    } header: {
                        Text("Business")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView(items: expenses)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        
        
    }
    
    
    
    func removeItems(expense: ExpenseItem){
        modelContext.delete(expense)
    }
    func colortingExpenses(expenseAmount: Double) -> Color{
        if (expenseAmount <= 10){
            return Color.green
        }else if (expenseAmount <= 100){
            return Color.yellow
        }else{
            return Color.red
        }
        
    }
}

#Preview {
    ContentView(expenseType: .all)
}
