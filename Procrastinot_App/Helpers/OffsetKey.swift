//
//  OffsetKey.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/7/24.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
