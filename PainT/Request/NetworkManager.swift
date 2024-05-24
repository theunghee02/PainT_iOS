//
//  NetworkManager.swift
//  PainT
//
//  Created by 최승희 on 5/23/24.
//

import Alamofire
import Combine

class NetworkManager: ObservableObject {
    @Published var diseases: [String] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchDiseases(username: String) {
        let url = "http://chi-iu.com/ai/predict"
        let parameters: [String: String] = ["username": username]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .publishDecodable(type: DiseaseResponse.self)
            .value()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                self?.diseases = [response.predicted_1, response.predicted_2, response.predicted_3, response.predicted_4, response.predicted_5]
            })
            .store(in: &cancellables)
    }
}
