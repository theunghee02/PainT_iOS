//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//
// 홈 페이지

import SwiftUI

struct homeSwiftUIView: View {
    // 질환명 get api 데이터
    @State var diseaseName: String = ""
    
    // 치유 가이드 리스트 get api 데이터
    @State var percent: Int = 0
//    @State var exerciseNames: [String] = ["Wall_Squats","Seated_Hamstring_Stretch","Wall_Squats","Seated_Hamstring_Stretch","Seated_Hamstring_Stretch"]
//    @State var exerciseCount: Int = 5
//    @State var exerciseTimes: [String] = ["15sec", "15sec", "15sec", "15sec", "15sec"]
//    @State var totalTime: String = "1분 15초"
        // 위와 동일 코드
    @State var exerciseNames: [String] = [""]
    @State var exerciseCount: Int = 0
    @State var exerciseTimes: [String] = [""]
    @State var totalTime: String = ""
    
    @State var currentIdx: Int = 0
    
    // 캘린더용
    // 오늘 날짜
    @State private var date = Date()
    // 모달 띄우는 Bool 변수
    @State private var isModalPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // 캘린더
                    // 캘린더 title
                    Text("통증 달력")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 23)
                        .padding(.top, 15)
                    
                    // 캘린더 뷰
                    VStack {
                        DatePicker(
                            "Start Date",
                            selection: $date,
                            in: ...Date(),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                        .onChange(of: date) {
                            isModalPresented = true
                        }
                    } // VStack
                    .padding(.horizontal, 20)
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
                        .frame(width: UIScreen.main.bounds.width, height: 2)
                        .padding(.bottom, 20)
                    
                    // 질환명
                    HStack(spacing: 0) {
                        Text("질환명 | ")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Text("\(diseaseName)")
                            .font(.system(size: 20))
                    } // HStack
                    .padding(.bottom, 25.0)
                    .padding(.horizontal, 23)
                    
                    // 치유 달성도
                    VStack {
                        // 제목 & 횟수
                        GeometryReader { geometry in
                            HStack(alignment: .center, spacing: 0) {
                                Text("오늘의 치유 달성도")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                //                                .padding(.trailing, 80)
                                Spacer()
                                //                            Text("\(count)")
                                //                                .font(.system(size: 24))
                                //                                .fontWeight(.bold)
                                //                            Text("번째 치유 중")
                            } // HStack
                            .frame(width: geometry.size.width)
                        } // GeometryReader
                        .padding(.bottom, 17.0)
                        
                        // 막대 & 퍼센트
                        HStack(alignment: .center) {
                            // 막대
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    // 전체 바
                                    Rectangle()
                                        .fill(Color(red: 0.63, green: 0.63, blue: 0.63))
                                        .frame(height: 10)
                                        .clipShape(RoundedRectangle(cornerRadius: 100))
                                    
                                    // 퍼센트 바
                                    Rectangle()
                                        .fill(Color("AccentColor"))
                                        .frame(width: geometry.size.width * (CGFloat(percent) / 100), height: 10)
                                        .clipShape(RoundedRectangle(cornerRadius: 100))
                                } // ZStack
                            } // GeometryReader
                            .padding(.top, 5.0)
                            
                            // 퍼센트 텍스트
                            Text("\(Int(percent))%")
                        } // HStack
                    } // VStack
                    .padding(.horizontal, 23)
                    .padding(.bottom, 20)
                    
                    // 추천 가이드 루틴
                    // 가이드 title
                    Text("치유 가이드")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 23)
                        .padding(.bottom, 20)
                    
                    // 가이드 list
                    VStack(alignment: .center, spacing: 0) {
                        HStack {
                            // 개수 & 시간
                            Text("총 \(exerciseCount)개 | 🕒 \(totalTime)")
                                .padding(.leading, 20)
                            
                            Spacer()
                            
                            // [버튼] 추천 가이드 시작하기
                            NavigationLink(destination: guideSwiftUIView(currentIdx: $currentIdx, exerciseNames: $exerciseNames, exerciseCount: $exerciseCount, percent: $percent)) {
                                Text("추천 가이드 시작하기")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hex: 0x252525)) // 글씨 색상
                                    .padding(14)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(14)
                            }
                            .padding(.trailing, 20)
                        } // HStack
                        .padding(.top, 20)
                        
                        // 루틴 리스트
                        ForEach(0..<exerciseCount, id: \.self) { idx in
                            exerciseRow(idx: idx, exerciseName: exerciseNames[idx], exerciseTime: exerciseTimes[idx], isLast: idx == exerciseCount-1)
                        }
                    } // VStack
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.bottom, 20.0)
                    .padding(.horizontal, 23)
                } // VStack
            } // ScrollView
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("appIcon")
                        .padding(.bottom, 10)
                }
            }
        } // NavigationStack
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            getDisease()
            getGuideList()
        }
    } // body
    
    // Exercise Row
    func exerciseRow(idx: Int, exerciseName: String, exerciseTime: String, isLast: Bool) -> some View {
        var body: some View {
            // 도착 화면
            let destination: AnyView
            // 가이드 리스트 중 idx
            @State var idx: Int = idx
            
            destination = AnyView(guideSwiftUIView(currentIdx: $idx, exerciseNames: $exerciseNames, exerciseCount: $exerciseCount, percent: $percent))
            
            return NavigationLink(destination: destination) {
                HStack {
                    AsyncImage(url: URL(string: "http://chi-iu.com/videos/download/image/\(exerciseName)")) { result in
                        result
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 70, height: 70)
                    .padding(.leading, 20)
                    .padding(.vertical, 15)
                    Text("\(exerciseName)")
                        .padding(.leading, 20)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("\(exerciseTime)")
                        .padding(.trailing, 20)
                        .foregroundColor(Color(.black))
                } // HStack
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(hex: 0x9E9E9E)),
                    alignment: .bottom
                )
            } // NavigationLink
        } // body
        return body
    } // exerciseRow()
    
    // -- api 연동
    // 질환명 get api
    func getDisease() {
        let authService = AuthService(apiPath: "/api/v1/disease?username=chii-u")
        authService.getRequest(resultType: getDiseaseResult.self) { response in
            print("----------------")
            print(response)
            switch response {
            case .success(let data):
                print("GET 요청 성공: \(response)")
                self.diseaseName = data.result?.disease ?? "척추관 협착증"
                
            case .failure(let error):
                print("GET 요청 실패: \(error.localizedDescription)")
            }
        }
    } // getDisease()
    
    // 가이드 리스트 get api 연동
    func getGuideList(){
        let authService = AuthService(apiPath: "/api/v1/home/exercise/chii-u/\(diseaseName)")
        authService.getRequest(resultType: getGuideResult.self) { response in
            print("----------------")
            print(response)
            switch response {
            case .success(let data):
                print("GET 요청 성공: \(response)")
// 예시             self.location[0] = data.result?[0].location ?? [""]
                
                self.exerciseNames = ["Bird Dog Exercise","Child Pose","Knee to Chest Stretch","Standing Back Extension"]
                self.exerciseCount = 4
                self.exerciseTimes = ["10sec", "10sec", "10sec", "15sec"]
                self.totalTime = "45초"
                    
            case .failure(let error):
                print("GET 요청 실패: \(error.localizedDescription)")
                
                self.exerciseNames = ["Bird Dog Exercise","Child Pose","Knee to Chest Stretch","Standing Back Extension"]
                self.exerciseCount = 4
                self.exerciseTimes = ["10sec", "10sec", "10sec", "15sec"]
                self.totalTime = "45초"
            }
        }
    } // getPainRecord()
} // homeSwiftUIView

// 통증 기록 날짜 클릭시 뜨는 모달뷰
struct modalView: View {
    // 선택된 날짜
    @Binding var selectedDate: Date
    
    // modalView get api 데이터
    @State var result: [PainRecordResult]?
    @State var resultCount: Int = 0
    @State var location: [[String?]] = [[""]]
    @State var intensity: [Int] = [0]
    @State var feelings: [[String?]] = [[""]]
    @State var trigger: [String?] = [""]
    @State var painTimestamp: [String?] = [""]
        // 테스트(위 동일 내용 코드)
//    @State var resultCount: Int = 5
//    @State var location: [[String?]] = [["허리"],["무릎"],["무릎"],["무릎"],["허리"]]
//    @State var intensity: [Int] = [0,2,4,6,8]
//    @State var feelings: [[String?]] = [["날카로운 느낌", "누르는 듯한 느낌"],
//                                        ["칼로 벤 것처럼 아픔", "타는 듯한 느낌", "둔한 느낌"],
//                                        ["날카로운 느낌", "누르는 듯한 느낌"],
//                                        ["칼로 벤 것처럼 아픔", "타는 듯한 느낌", "둔한 느낌"],
//                                        ["칼로 벤 것처럼 아픔", "타는 듯한 느낌", "둔한 느낌"]]
//    @State var trigger: [String?] = ["오래 서 있으면 통증이 시작됨", "장시간 걸을 때", "앉아 있다가 일어날 때", "침대에서 일어나려 할 때", "계단을 내려갈 때"]
//    @State var painTimestamp: [String?] = ["","","","",""]
    
    // 강도 색깔
    @State var intensityColor: [Color] = [Color(hex: 0xCDCDCD)]
//    @State var intensityColor: [Color] = [Color(hex: 0xCDCDCD),Color(hex: 0xCDCDCD),Color(hex: 0xCDCDCD),Color(hex: 0xCDCDCD),Color(hex: 0xCDCDCD)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("통증 기록")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .padding([.top,.leading], 30)
                        
                        // 날짜를 원하는 형식의 문자열로 변환
                        let dateFormatter: DateFormatter = {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "YYYY년 MM월 dd일"
                            return formatter
                        }()
                        
                        Text("\(dateFormatter.string(from: selectedDate))")
                            .padding(.leading, 30)
                            .padding(.bottom, 10)
                    } // VStack - 제목, 날짜
                    
                    Spacer()
                } // HStack
                
                // 통증 기록 리스트
                ForEach(0..<resultCount) { resultIdx in
                    // 전체 감싸는 wrapper
                    HStack(alignment: .top) {
                        // 시간
                            // 시간으로 변환
                        let string2DateFormatter: DateFormatter = {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                            dateFormatter.locale = Locale(identifier: "ko_KR")
                            dateFormatter.timeZone = TimeZone.current
                            return dateFormatter
                        }()
                        
                        let painDate = string2DateFormatter.date(from: painTimestamp[resultIdx] ?? "")
                        
                        
                        let timeFormatter: DateFormatter = {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "a h:mm"
                            formatter.locale = Locale(identifier:"ko_KR")
                            formatter.timeZone = TimeZone.current
                            return formatter
                        }()
                        
                            // 시간 Text
                        Text("\(timeFormatter.string(from: painDate ?? Date()))")
                            .font(.system(size: 12))
                            .padding(.trailing, 13)
                        
                        // 통증 기록 요소
                        VStack(alignment: .leading, spacing: 0) {
                            // 통증유발행동(trigger), 통증 느낌(type)
                            // 위치(location), 발생시간(pain_timestamp), 예측 질환, 통증 강도(intensity),
                            HStack(alignment: .center) {
                                Text("\(location[resultIdx][0] ?? "") 통증")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(hex: 0x252525))
                                
                                Spacer()
                                
                                Text("고통 \(intensity[resultIdx])")
                                    .foregroundStyle(Color(hex: 0x252525))
                                    .padding(.horizontal ,10)
                                    .padding(.vertical ,5)
                                    .background(intensityColor[resultIdx])
                                    .cornerRadius(20)
                            }
                            .padding([.top, .horizontal], 30)
                            .padding(.bottom, 13)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach (0..<feelings[resultIdx].count, id: \.self) { idx in
                                    Text("\(feelings[resultIdx][idx]!)")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(hex: 0x252525))
                                        .padding(.horizontal ,10)
                                        .padding(.vertical ,5)
                                        .background(Color(hex: 0xCDCDCD))
                                        .cornerRadius(20)
                                } // ForEach
                            } // HStack
                            .padding(.horizontal, 30)
                            .padding(.bottom, 7)
                            Text("\(trigger[resultIdx] ?? "")")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(hex: 0x252525))
                                .padding(.horizontal ,10)
                                .padding(.vertical ,5)
                                .background(Color(hex: 0x04DC88, alpha: 0.2))
                                .cornerRadius(20)
                                .padding([.horizontal,.bottom], 30)
                            
//                            HStack {
//                                Image("wand")
//                                    .resizable()
//                                    .frame(width: 15, height: 15)
//                                    .padding(.trailing, 10)
//                                Text("척추관 협착증 예상")
//                                    .font(.system(size: 16))
//                                    .fontWeight(.semibold)
//                                    .foregroundStyle(Color(hex: 0x555555))
//                                Spacer()
//                            } // HStack
//                            .padding([.horizontal, .bottom], 30)
                        } // VStack - (시간 제외한) 통증 기록 요소
                        .background(Color(hex: 0xEBE9EE))
                        .cornerRadius(30)
                    } // HStack - wrapper
                    .padding([.horizontal,.bottom], 30)
                } // ForEach
            } // VStack
        } // ScrollView
        .onAppear() {
            getPainRecord()
        }
    } // body
    
    // 통증 강도 색깔 결정
    func updateIntensityColor(resultIdx: Int) {
        switch intensity[resultIdx] {
        case 0:
            intensityColor[resultIdx] = Color(hex: 0xFFDC7C, alpha: 0.5)
        case 2:
            intensityColor[resultIdx] = Color(hex: 0xFAD36A, alpha: 0.5)
        case 4:
            intensityColor[resultIdx] = Color(hex: 0xFABE6C, alpha: 0.5)
        case 6:
            intensityColor[resultIdx] = Color(hex: 0xFBA946, alpha: 0.5)
        case 8:
            intensityColor[resultIdx] = Color(hex: 0xFA7343, alpha: 0.5)
        case 10:
            intensityColor[resultIdx] = Color(hex: 0xFF2F1D, alpha: 0.5)
        default:
            intensityColor[resultIdx] = Color(hex: 0xCDCDCD, alpha: 0.5)
        }
    } // updateIntensityColor()
    
    // -- api 연동
    // 날짜를 원하는 형식의 문자열로 변환
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
    
    // 통증 기록 get api 연동
    func getPainRecord(){
        let authService = AuthService(apiPath: "/api/v1/home/chii-u/date?painDate=\(dateFormatter.string(from: selectedDate))")
        authService.getRequest() { response in
            print("----------------")
            print(response)
            switch response {
            case .success(let data):
                print("GET 요청 성공: \(response)")
                self.result = data.result
                self.resultCount = self.result?.count ?? 0
                for idx in 0..<resultCount {
                    self.location[idx] = data.result?[idx].location ?? [""]
                    self.intensity[idx] = data.result?[idx].intensity ?? 0
                    self.feelings[idx] = data.result?[idx].type ?? [""]
                    self.trigger[idx] = data.result?[idx].trigger ?? ""
                    self.painTimestamp[idx] = data.result?[idx].painTimestamp ?? ""
                    
                    // intensity에 따른 배경 색(intensityColor) 변경
                    updateIntensityColor(resultIdx: idx)
                }
            case .failure(let error):
                print("GET 요청 실패: \(error.localizedDescription)")
            }
        }
    } // getPainRecord()
} // modalView

