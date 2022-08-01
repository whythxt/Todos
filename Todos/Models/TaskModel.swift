//
//  TaskModel.swift
//  Todos
//
//  Created by Yurii on 21.07.2022.
//

import Foundation

struct Task: Codable, Hashable {
    let title: String
    let description: String
    let priority: String
    
    static let example = Task(title: "Task", description: "Sample description", priority: "MEDIUM")
}

class TaskModel: ObservableObject {
    @Published private(set) var tasks: [Task]
    
    let saveKey = "Tasks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Task].self, from: data) {
                tasks = decoded
                return
            }
        }
        
        tasks = []
    }
    
    func add(title: String, description: String, priority: String) {
        let task = Task(title: title, description: description, priority: priority)
        tasks.append(task)
        
        save()
    }
    
    func remove(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        
        tasks.remove(at: index)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
