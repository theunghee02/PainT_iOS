//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//
// 홈 페이지

import SwiftUI

struct homeSwiftUIView: View {
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
                    modalView(selectedDate: $date)
                        .presentationDetents([.fraction(0.8)])
                        .presentationDragIndicator(.visible)
                }
                
                
                
                // 구분선
                Rectangle()
                    .foregroundStyle(Color(hex: 0xF0F0F0))
                    .frame(width: UIScreen.main.bounds.width, height: 3)
                
                // 문구
                Text("수정님, 허리가 아프지 않으세요?")
                    .font(.system(size: 18))
                    .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    .padding(.top, 10.0)
                
                HStack(spacing: 15) {
                    // Pain Record
                    NavigationLink(destination: painRecordUnitySwiftUIView()) {
                        VStack {
                            Text("통증 기록")
                                .font(.system(size: 18))
                                .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                                .padding(10)
                            Text("내 몸의 통증을\n기록해서 확인하기")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: 0x6E6E6E))
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Image("clipBoard")
                        } // VStack
                        .frame(width: 160, height: 190)
                        .background(Color(hex: 0xD9D9D9))
                        .cornerRadius(10)
//                        .padding(.vertical, 20)
                    }
                    
                    // Disease Prediction
                    NavigationLink(destination: DiseasePredictionSwiftUIView()) {
                        VStack {
                            Text("질환 예측")
                                .font(.system(size: 18))
                                .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                                .padding(10)
                            Text("통증을 종합해서\n질환 예측해보기")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: 0x6E6E6E))
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Image("wand")
                        } // VStack
                        .frame(width: 160, height: 190)
                        .background(Color(hex: 0xD9D9D9))
                        .cornerRadius(10)
                    }
                } // HStack
            } // VStack
        } // ScrollView
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("appIcon")
            }
        }
    }
}

struct modalView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    Text("통증 기록")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                    
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

struct calendarView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        Text("Calendar for \(selectedDate, formatter: dateFormatter)")
            .font(.headline)
            .padding()
    }
    
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
}

#Preview {
    homeSwiftUIView()
}
