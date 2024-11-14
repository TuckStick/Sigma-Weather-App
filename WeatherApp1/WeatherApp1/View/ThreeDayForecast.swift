//
//  threedayforcast.swift
//  WeatherApp1
//
//  Created by AM Student on 9/5/24.
//

import SwiftUI
 
struct ThreeDayForecast: View {
    
    var forecast: [ForecastDay]
    
    var body: some View {
        
        LazyVStack {
            
            ForEach(forecast.prefix(3), id: \.date) { forecastDay in
                dailyCell(forecastDay: forecastDay)
                }
            }
        }
    private func dailyCell(forecastDay: ForecastDay) -> some View {
        HStack {
            Text(dayOfWeek(for: forecastDay.date))
            
            Spacer()
            
            Text("High: \(Int(round(forecastDay.day.maxtemp_f)))°F")
            
            Spacer()
            
            Text("Low: \(Int(round(forecastDay.day.mintemp_f)))°F")
            
            Spacer()
            
            Image(systemName: weathericonViewModel(for: forecastDay.day.condition.code))
        }
        
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical,15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors:[Color("ColorOne"),Color("ColorTwo")]), startPoint:.topLeading,endPoint: .bottomTrailing)))
        
        .shadow(color: Color.white.opacity(0.1),radius:2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.1),radius:2, x: 2, y: 2)
    }
        private func dayOfWeek(for dateString: String) -> String {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                guard let date = dateFormatter.date(from: dateString) else { return ""
                }
                dateFormatter.dateFormat = "EEEE"
                return dateFormatter.string(from: date)
        
    }
}
 
//#Preview {
//    ThreeDayForecast()
//}
