//
//  ContentView.swift
//  Todos
//
//  Created by Yurii on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tm = TaskModel()
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Todo's ✅", systemImage: "house.fill")
                }
            
            SortView()
                .tabItem {
                    Label("Sort", systemImage: "chart.bar.doc.horizontal")
                }
        }
        .environmentObject(tm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
