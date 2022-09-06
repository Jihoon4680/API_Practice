//
//  Model.swift
//  Corona_API
//
//  Created by 안지훈 on 8/30/22.

import Foundation

struct Covid: Codable {
    let korea, seoul, busan, daegu: City
    let incheon, gwangju, daejeon, ulsan: City
    let sejong, gyeonggi, gangwon, chungbuk: City
    let chungnam, jeonbuk, jeonnam, gyeongbuk: City
    let gyeongnam, jeju, quarantine: City
}

// MARK: - Busan
struct City: Codable {
    let countryName, totalCase,percentage: String
    let newCase : Int
}

let CityList: [String] = [
    "korea","seoul", "busan", "daegu",
    "incheon", "gwangju", "daejeon", "ulsan",
    "sejong", "gyeonggi", "gangwon", "chungbuk",
    "chungnam", "jeonbuk", "jeonnam", "gyeongbuk",
    "gyeongnam", "jeju"
]
 

