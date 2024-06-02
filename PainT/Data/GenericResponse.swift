//
//  Response.swift
//  PainT
//
//  Created by 최승희 on 5/29/24.
//

import Foundation

struct GenericResponse<T: Decodable>: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: T?
}
