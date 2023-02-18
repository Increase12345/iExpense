//
//  AddView.swift
//  iExpense
//
//  Created by Nick Pavlov on 2/16/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Busines", "Personal"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                    .opacity(0.9)
                
                VStack(spacing: 50) {
                    TextField("Name Of Expense", text: $name)
                        .font(.title3)
                        .padding(.top, 50)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 5)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 5)
                    
                        .navigationTitle("Add new expense")
                    
                    Button("Save") {
                        let expens = ExpensesItem(name: name, type: type, amount: amount)
                        expenses.items.append(expens)
                        dismiss()
                    }
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(width: 150, height: 50)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
