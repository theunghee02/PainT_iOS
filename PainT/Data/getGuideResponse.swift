//
//  getGuideResult.swift
//  PainT
//
//  Created by 최승희 on 10/12/24.
//

import Foundation

struct getGuideResult: Decodable {
    let exerciseNames: [String?]
    let filenames: [String?]
    let times: [String?]
    let diseaseName: String?
    let totalTime: String?
    let exerciseCount: Int
}
