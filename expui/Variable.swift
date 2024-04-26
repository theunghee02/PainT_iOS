//
//  Variable.swift
//  expui
//
//  Created by Shin Yeong Gwak on 2024/04/25.
//

import SwiftUI

class Variable: ObservableObject {
    @Published var username: String = ""
    @Published var backgroundColor: Color = Color(hex: "#04DC88")
}
