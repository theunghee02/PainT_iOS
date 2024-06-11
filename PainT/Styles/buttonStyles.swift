//
//  buttonStyles.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import SwiftUI


struct BasicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height:40)
                .padding(10)
                .background(Color.black)
                .cornerRadius(10)
    }
}

struct MiniButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                .foregroundColor(.white)
                .frame(width: 40)
                .frame(height:40)
                .padding(10)
                .background(Color.black)
                .cornerRadius(10)
    }
}

struct NoColorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height:40)
                .padding(10)
                .cornerRadius(10)
                
    }
}
