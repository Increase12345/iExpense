//
//  ContentView.swift
//  iExpense
//
//  Created by Nick Pavlov on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                
                // Working space for items
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            // Item name
                            Text(item.name)
                                .font(.title3)
                            
                            // Item account
                            Text(item.type)
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        }
                        Spacer()
                        
                        // Item amount
                        Text("\(item.amount, format: .currency(code: "USD"))")
                            .foregroundColor(item.amount <= 10 ? .green : item.amount <= 50 ? .indigo : item.amount <= 100 ? .yellow : .red)
                            .font(.title3)
                            .bold()
                    }
                }
                .onDelete(perform: removeItems(of:))
            }
            .padding(.top, 1)
            .scrollContentBackground(.hidden)
            .background(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.8))
            .shadow(radius: 5)
            .navigationTitle("iExpense")
            
            // Tot Plus and Edit buttons
            .toolbar {
                EditButton()
                    .bold()
                    .foregroundColor(.gray)
                
                Button(action: {
                    showingAddExpense.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                        .bold()
                })
            }
        }
        
        // View for adding items
        .sheet(isPresented: $showingAddExpense, content: {
            AddView(expenses: expenses)
        })
    }
    
    // Method for removing items
    func removeItems(of offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
