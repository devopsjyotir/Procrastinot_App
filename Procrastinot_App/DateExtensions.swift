//
//  DateExtensions.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/5/24.
//

import SwiftUI

extension Date{
    func format(_ format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
