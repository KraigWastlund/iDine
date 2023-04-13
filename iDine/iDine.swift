//
//  SwiftUIByExampleApp.swift
//  SwiftUIByExample
//
//  Created by Kraig Wastlund on 4/12/23.
//

import SwiftUI

@main
struct iDine: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
