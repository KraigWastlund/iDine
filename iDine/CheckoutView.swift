//
//  CheckoutView.swift
//  SwiftUIByExample
//
//  Created by Kraig Wastlund on 4/13/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    private let paymentTypes = ["Cash", "Credit Card", "iDone Points"]
    private let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = "Cash"
    @State private var addLotaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showPaymentAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(paymentTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Toggle("Add iDine loyalty card", isOn: $addLotaltyDetails.animation())
                    if addLotaltyDetails {
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                }
                Section("Tip") {
                    Picker("Amount to tip", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total: \(order.totalPrice(tip: tipAmount))") {
                    Button("Confirm Order") {
                        showPaymentAlert = true
                    }
                }
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Order confirmed", isPresented: $showPaymentAlert) {
            // add buttons here
        } message: {
            Text("Your total was \(order.totalPrice(tip: tipAmount)) - thank you!!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
