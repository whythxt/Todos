//
//  MainView.swift
//  Todos
//
//  Created by Yurii on 20.07.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tm: TaskModel
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                
                VStack {
                    ForEach(tm.tasks, id: \.self) { task in
                        RowView(task: task)
                            .contextMenu {
                                Button("Delete", role: .destructive) {
                                    tm.remove(task)
                                }
                            }
                            
                    }
                }
            }
            .navigationTitle("Todo's ✅")
            .sheet(isPresented: $showingSheet) {
                AddView(tm: tm)
            }
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskModel())
    }
}
