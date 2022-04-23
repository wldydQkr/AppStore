//
//  Feature.swift
//  AppStore
//
//  Created by 박지용 on 2022/04/23.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
