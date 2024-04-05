//
//  Task.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/5/24.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var title: String
    var caption: String
    var date: Date = .init()
    var isCompleted = false
    var tint: Color
}

// Sample Task
var sampleTask: [Task] = [
    .init(title: "Wake Up", caption: "wohoo up ", date: Date.now, tint: .yellow),
    .init(title: "Gym", caption: "Get that work in", date: Date.now, tint: .gray),
    .init(title: "Ui Design", caption: "Procrastinot App", date: Date.now, tint: .green),
    .init(title: "Delegate", caption: "Procrastinot App", date: Date.now, tint: .purple),
]

//Date Extension
extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
