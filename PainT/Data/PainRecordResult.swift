//
//  PainRecordResult.swift
//  PainT
//
//  Created by 최승희 on 5/23/24.
//

import Foundation

struct PainRecordResult: Decodable {
    let id: String?
    let username: String!
    let location: [String?]
    let trigger: String?
    let painTimestamp: String?
    let type: [String?]
    let intensity: Int?
}

struct PainRecordResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [PainRecordResult]?
}
