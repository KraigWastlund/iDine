//
//  OrderView.swift
//  SwiftUIByExample
//
//  Created by Kraig Wastlund on 4/13/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            Group {
                if order.items.isEmpty {
                    Text("Nothing yet ordered.")
                        .font(.headline)
                } else {
                    List {
                        Section {
                            ForEach(order.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text("Price: \(item.price)")
                                }
                            }
                            .onDelete { indexSet in
                                deleteItems(at: indexSet)
                            }
                        }
                        Section {
                            NavigationLink("Place Oder") {
                                CheckoutView()
                            }
                        }
                    }
                    .toolbar {
                        EditButton()
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}

extension OrderView {
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
