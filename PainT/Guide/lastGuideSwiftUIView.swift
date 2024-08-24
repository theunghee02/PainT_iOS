//
//  lastGuideSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/24/24.
//

import SwiftUI

struct lastGuideSwiftUIView: View {
    var currentCount: Int = 2
    var totalCount: Int = 2
    var exerciseName: String = "Seated_Hamstring_Stretch"
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(currentCount) / \(totalCount)")
                .padding(.bottom, 10)
            Text("\(exerciseName)")
                .font(.system(size: 24))
            AsyncImage(url: /*@START_MENU_TOKEN@*/URL(string: "https://example.com/icon.png")/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 300)
                .padding(.top, 50)
                .padding(.horizontal, 30)
            
            Spacer()
            
            // 다음 가이드
//            HStack {
//                AsyncImage(url: /*@START_MENU_TOKEN@*/URL(string: "https://example.com/icon.png")/*@END_MENU_TOKEN@*/)
//                    .frame(width: 70, height: 70)
//                    .padding([.vertical, .leading], 15)
//                    .padding(.trailing, 20)
//                
//                // Texts
//                VStack(alignment: .leading) {
//                    // Title
//                    Text("다음 가이드")
//                        .foregroundStyle(Color("AccentColor"))
//                        .padding(.bottom, 6)
//                    
//                    // 운동 이름
//                    Text("\(excercise2Name)")
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                } // VStack
//                
//                Spacer()
//            } // HStack
//            .frame(width: 300)
//            .background(Color(hex: 0xF0F0F0))
//            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color(hex: 0x919296))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // 재생 버튼
                Image("triangle")
            } // ZStack

            .padding(30)
            
            
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(tabSwiftUIView()))
        } // VStack
    }
}

#Preview {
    lastGuideSwiftUIView()
}
