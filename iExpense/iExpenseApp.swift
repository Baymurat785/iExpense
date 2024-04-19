//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Baymurat Abdumuratov on 28/02/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(expenseType: .all)
                .modelContainer(for: [ExpenseItem.self])
            
        }
    }
}
