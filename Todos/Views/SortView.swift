//
//  SortView.swift
//  Todos
//
//  Created by Yurii on 20.07.2022.
//

import SwiftUI

struct SortView: View {
    let options = ["Low", "Medium", "High"]
    
    var filteredData: [Task] {
        switch selected {
        case "Low":
            return tm.tasks.filter { $0.priority == "LOW" }
        case "Medium":
            return tm.tasks.filter { $0.priority == "MEDIUM" }
        default:
            return tm.tasks.filter { $0.priority == "HIGH" }
        }
    }
    
    @EnvironmentObject var tm: TaskModel
    
    @State private var selected = "Low"
    
    var body: some View {
        ScrollView {
            VStack {
                Picker("", selection: $selected) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 200)
                
                Divider()
                    .padding(.horizontal)
                
                VStack {
                    ForEach(filteredData, id: \.self) { task in
                        RowView(task: task)
                    }
                }
            }
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
            .environmentObject(TaskModel())
    }
}
