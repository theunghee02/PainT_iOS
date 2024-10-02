//
//  calendarHomeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//
// 캘린더만 있는 페이지(사용 안 함)

import SwiftUI

struct calendarHomeSwiftUIView: View {
    @State private var date = Date()
    @State private var isModalPresented = false
    
    var body: some View {
        ScrollView {
            VStack {
                // 캘린더
                VStack {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: date) {
                        isModalPresented = true
                    }
                } // VStack
                .padding(.horizontal, 15)
                .sheet(isPresented: $isModalPresented, onDismiss: {
                    isModalPresented = false
                }) {
                    ModalView(selectedDate: $date)
                        .presentationDetents([.fraction(0.8)])
                        .presentationDragIndicator(.visible)
                }
                
                // 구분선
                Rectangle()
                    .foregroundStyle(Color(hex: 0xF0F0F0))
                    .frame(width: UIScreen.main.bounds.width, height: 3)
            } // VStack
        } // ScrollView
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("appIcon")
            }
        }
    }
}

struct ModalView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    Text("통증 기록")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                    
                    // 날짜를 원하는 형식의 문자열로 변환
                    let dateFormatter: DateFormatter = {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "YYYY년 MM월 dd일"
                        return formatter
                    }()
                    
                    Text("\(dateFormatter.string(from: selectedDate))")
                    
                    // 통증 기록 리스트
                    ForEach(0..<3) { _ in
                        VStack(alignment: .leading) {
                            Text("통증 위치")
                            HStack {
                                Text("쑤시는 느낌")
                                Text("원인 모름")
                                Text("고통 8")
                            } // HStack
                        } // VStack
                        .background(Color("AccentColor").opacity(0.5))
                    } // List
                } // VStack
                .frame(minWidth: geometry.size.width*0.7)
            } // GeometryReader
        } // ScrollView
    }
}

#Preview {
    homeSwiftUIView()
}
