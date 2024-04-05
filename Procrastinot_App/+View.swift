//
//  +View.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/5/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: <#T##Alignment#>)
    }
}
