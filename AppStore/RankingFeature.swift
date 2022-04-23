//
//  RankingFeature.swift
//  AppStore
//
//  Created by 박지용 on 2022/04/23.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
