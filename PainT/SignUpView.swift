//
// Created by Shin Yeong Gwak on 2024/04/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        }).padding()
    }
}

struct SignUpView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                // 컴포넌트를 만들고 내용만 딴데서 불러오면 좋겠다. 이건 너무 하드코드야.
                ScrollView {
                    Text("이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.")
                }
                .padding()
                .frame(height: 100)
                Toggle(isOn: $isOn) {
                    Text("약관에 동의합니다.")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                
                ScrollView {
                    Text("이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.")
                }
                .frame(height: 100)
                
                Toggle(isOn: $isOn) {
                    Text("약관에 동의합니다.")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                
                ScrollView {
                    Text("이것은 내 테스트 약관으로 노예계약이다. 넌 나에게서 벗어날 수 없고 어쩌고 저쩌고.... 100년동안 내 머슴이 돼라! 동의 하지 않으면 앱을 풀어주지 않을것.")
                }
                .frame(height: 100)
                
                Toggle(isOn: $isOn) {
                    Text("약관에 동의합니다.")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                
                
                Button(action: {
                    
                }) {
                    Text("다음")
                }
                .buttonStyle(CustomButtonStyle())
            }
            .navigationTitle("약관 동의")
            
        }
        .padding()
    }

}

#Preview {
    SignUpView()
}
