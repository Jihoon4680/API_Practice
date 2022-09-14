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
    
    init(countryName : String, totalCase : String, percentage : String, newCase : Int){
        self.countryName = countryName
        self.totalCase = totalCase
        self.percentage = percentage
        self.newCase = newCase
    }
    // 빈값 이니셜라이저
    init(){
        self.countryName = "0"
        self.totalCase = "0"
        self.percentage = "0"
        self.newCase = 0
    }
    
}


let CityList: [String] = [
    "korea","seoul", "busan", "daegu",
    "incheon", "gwangju", "daejeon", "ulsan",
    "sejong", "gyeonggi", "gangwon", "chungbuk",
    "chungnam", "jeonbuk", "jeonnam", "gyeongbuk",
    "gyeongnam", "jeju"
]
 

