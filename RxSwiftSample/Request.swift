//
//  Request.swift
//  RxSwiftSample
//
//  Created by 原野誉大 on 2018/02/27.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeather(q: String, APIKEY: String)
}


extension WeatherAPI: TargetType {
    var sampleData: Data {
        switch self {
        case .getWeather:
            return "Stub".data(using: String.Encoding.utf8)!
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    var baseURL: URL {
        return URL(string:"https://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "/weather"
        }
    }
    
    var task: Task {
        switch self {
        case .getWeather(let q, let APIKEY):
            return .requestParameters(parameters: ["q": q, "appid": APIKEY], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

struct WeatherObject: Codable {
    let city: City
    let cnt: Int
    let cod: String
    let list:[Forecast]
}

struct City: Codable {
    let coord: Coord
    let country: String
    let id: Int
    let name: String
}
struct Coord: Codable {
    let lat: Double
    let lon: Double
}
struct Forecast: Codable {
    let clouds: Clouds
    let dt: Int
    let dt_txt: String
    let main: Main
    let sys:Sys
    let weather: Weather
    let wind: Wind
}

struct Clouds: Codable {
    let all: Int
}
struct Main: Codable {
    let grnd_level: Double
    let humidity: Int
    let pressure: Double
    let sea_level: Double
    let temp: Double
    let temp_kf: Double
    let temp_max: Double
    let temp_min: Double
}
struct Sys: Codable {
    let pod: String
}
struct Weather: Codable {
    let description: String
    let icon: String
    let id: Int
    let main: String
}

struct Wind: Codable {
    let deg: Double
    let speed: Double
}
