//
//  ContentView.swift
//  SwiftUIByExample
//
//  Created by Kraig Wastlund on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
