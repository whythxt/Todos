//
//  AddView.swift
//  Todos
//
//  Created by Yurii on 20.07.2022.
//

import SwiftUI

struct AddView: View {
    let priorities = ["LOW", "MEDIUM", "HIGH"]
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var tm: TaskModel
    
    @State private var title = ""
    @State private var description = ""
    @State private var priority = "MEDIUM"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section {
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("Add New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save") {
                        tm.add(title: title, description: description, priority: priority)
                        dismiss()
                    }
                }
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(tm: TaskModel())
    }
}
