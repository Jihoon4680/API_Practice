//
//  Model.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/14/22.
//

import Foundation

struct Model : Codable{
    
    let name : String
    let main : Main
    let weather : [Weather]
    
}

struct Main : Codable {
    
    let temp : Double
    let temp_min : Double
    let temp_max : Double
    
}

struct Weather : Codable {
    var description : String
    var icon : String
}

let CityList = [
    "Gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon",
    "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "suwon", "Iksan", "Suncheon",
    "Ulsan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon"
]

// API 값 받으면 return 하는 city name -> 한글 name 으로 변경
var CityKoreaListDic: [[String: String]] = [
    ["Gongju": "공주"], ["Mokpo": "목포"], ["Gumi": "구미"], ["Busan": "부산"], ["Seosan City": "서산"], ["Seoul": "서울"], ["Daegu": "대구"], ["Gwangju": "광주"], ["Gunsan": "군산"], ["Daejeon": "대전"], ["Sokcho": "속초"], ["Iksan": "익산"], ["Suwon-si": "수원"], ["Suncheon": "순천"], ["Ulsan": "울산"], ["Jeonju": "전주"], ["Jeju City": "제주"], ["Cheonan": "천안"], ["Cheongju-si": "청주"], ["Chuncheon": "춘천"]
]

// API 값 받으면 return 하는 description -> 한글 설명으로 변경
var DescriptionListDic: [[String: String]] = [
    ["맑음": "clear sky"], ["약간 흐림": "few clouds"], ["약간 흐림": "scattered clouds"], ["약간 흐림": "broken clouds"], ["소나기": "shower rain"], ["비": "rain"],
    ["뇌우": "thunderstorm"], ["눈": "snow"], ["안개": "mist"], ["약한 비를 동반한 뇌우": "thunderstorm with light rain"], ["비를 동반한 뇌우": "thunderstorm with rain"], ["강한 비를 동반한 뇌우": "thunderstorm with heavy rain"], ["약한 뇌우": "light thunderstorm"], ["강한 뇌우": "heavy thunderstorm"], ["뇌우": "ragged thunderstorm"], ["가랑비를 동반한 뇌우": "thunderstorm with light drizzle"], ["가랑비를 동반한 뇌우": "thunderstorm with drizzle"], ["가랑비를 동반한 뇌우": "thunderstorm with heavy drizzle"], ["가랑비": "Drizzle"], ["약한 가랑비": "light intensity drizzle"], ["가랑비": "heavy intensity drizzle"], ["약한 가랑비": "light intensity drizzle rain"], ["가랑비": "drizzle rain"], ["가랑비": "heavy intensity drizzle rain"], ["가랑비": "shower rain and drizzle"], ["가랑비": "heavy shower rain and drizzle"], ["가랑비": "shower drizzle"], ["약한 비": "light rain"], ["비": "moderate rain"], ["비": "heavy intensity rain"], ["비": "very heavy rain"], ["비": "extreme rain"], ["비": "freezing rain"], ["약한 비": "light intensity shower rain"], ["약한 비": "shower rain"], ["비": "heavy intensity shower rain"], ["비": "ragged shower rain"], ["약한 눈": "light snow"], ["눈": "heavy snow"], ["진눈깨비": "sleet"], ["약한 눈": "light shower sleet"], ["약한 진눈깨비": "shower sleet"], ["약한 비와 눈": "light rain and snow"], ["비와 눈": "rain and snow"], ["약한 눈": "light shower snow"], ["약한 눈": "shower snow"], ["눈": "heavy shower snow"], ["안개": "smoke"], ["실안개": "haze"], ["모래먼지": "sand/ dust whirls"], ["안개": "fog"], ["모래": "sand"], ["먼지": "dust"], ["화산재": "volcanic ash"], ["안개": "squalls"], ["토네이도": "tornado"], ["흐림": "scattered clouds"], ["흐림": "broken clouds"], ["많이 흐림": "overcast clouds"]
]
