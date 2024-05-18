//
//  checkBoxSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import SwiftUI


struct checkboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return GeometryReader { proxy in
            HStack(alignment: .top) {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(configuration.isOn ? .accentColor : .gray)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    configuration.label
            } // HStack
            .frame(width: proxy.size.width, alignment: .leading)
            .onTapGesture { configuration.isOn.toggle() }
          } // GeometryReader
        

    }
}

struct RadioButtonView: View {
    let index: Bool
    @Binding var gender: Bool

    var body: some View {
        Button(action: {
            gender = index
            // 라디오 버튼 동작 로직 추가
        }) {
            HStack {
                Image(systemName: gender == index ? "circle.fill" : "circle")
                    .imageScale(.large)
                if(index == true) {
                    Text("남")
                        .foregroundColor(Color.black)
                } else if (index == false) {
                    Text("여")
                        .foregroundColor(Color.black)
                }
            }
            .padding()
        }
    }
}

