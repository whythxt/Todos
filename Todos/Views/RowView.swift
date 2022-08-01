//
//  RowView.swift
//  Todos
//
//  Created by Yurii on 21.07.2022.
//

import SwiftUI

struct RowView: View {
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .bold()
                    .padding(.bottom, 1)
                
                Text(task.description)
                    .font(.footnote)
                
                Text(task.priority)
                    .font(.footnote)
                    .foregroundColor(priorityColor(task.priority))
                
                Divider()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    func priorityColor(_ text: String)  -> Color {
        switch text {
        case "LOW": return .blue
        case "MEDIUM": return .gray
        default: return .red
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(task: .example)
    }
}
