//
//  WeathericonViewModel.swift
//  WeatherApp1
//
//  Created by AM Student on 10/14/24.
//

import SwiftUI

func weathericonViewModel(for conditionCode: Int) -> String {
    switch conditionCode {
    case 1000:
        return "sun.max.fill"
    case 1003:
        return "cloud.sun.fill"
    case 1006, 1009:
        return "cloud.fill"
    case 1030, 1135, 1147:
        return"cloud.fog.fill"
    case 1063, 1150, 1153, 1168, 1171:
        return"cloud.drizzle.fill"
               case 1066, 1204, 1249, 1198, 1201:
                return "cloud.sleet.fill"
               case 1087, 1243, 1246, 1273, 1276:
                return "cloud.bolt.rain.fill"
               case 1114, 1117:
                return "wind.snow"
               case 1180, 1183, 1240:
                return "cloud.rain.fill"
    case 1186, 1189, 1192, 1195:
        return "cloud.heavyrain.fill"
    case 1237,1261:
        return "cloud.hail.fill"
    case 1264:
        return "cloud.sleet.fill"
    default:
        return "questiomark"
    }
}
