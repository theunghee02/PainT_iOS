//
//  diseseModel.swift
//  PainT
//
//  Created by 최승희 on 5/23/24.
//

import Foundation

struct DiseaseResponse: Codable, Identifiable {
    var id: UUID = UUID()
    
    let predicted_1: String
    let predicted_2: String
    let predicted_3: String
    let predicted_4: String
    let predicted_5: String
    let username: String
}
