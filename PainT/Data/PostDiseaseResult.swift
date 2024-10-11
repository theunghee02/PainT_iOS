//
//  PostDiseaseResult.swift
//  PainT
//
//  Created by 최승희 on 5/23/24.
//

import Foundation

struct PostDiseaseResult: Decodable {
    let message: String?
}

struct PostDiseaseResponse: Encodable {
    let username : String
    let disease : String
}
