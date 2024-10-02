//
//  DiseaseResult.swift
//  PainT
//
//  Created by 최승희 on 5/23/24.
//

import Foundation

struct Disease2Result: Decodable {
    let description1: String?
    let description2: String?
    let predicted_1: String?
    let predicted_2: String?
    let username: String
    let where_2_go_1: String?
    let where_2_go_2: String?
}
