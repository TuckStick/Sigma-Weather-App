//
//  ContentView.swift
//  WeatherApp1
//
//  Created by AM Student on 9/5/24.
//

//
//  ContentView.swift
//  Weather
//
//  Created by AM Student on 9/4/24.
//
 
import SwiftUI
 
struct ContentView: View {
    
    @StateObject private var viewModel = WeatherView()
    @State private var cityName = "Tulsa"
    var body: some View {
        VStack {
            Spacer() .frame(height: 50)
            
            SearchHeaderView(fetchWeather: { cityName in
                viewModel.fetchWeather(for: cityName)
            })
            
            if let city = viewModel.weatherResponce?.location.name {
                CityNameView(city: city)
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            
            
        } else {
            Currentweatherview(weather: viewModel.weatherResponce)
        }
            
            if let weather = viewModel
            .weatherResponce {
                ThreeDayForecast(forecast:weather.forecast .forecastday)
                    .padding(.top, 20)
            } else {
                Text("Loading forecast...")
            }
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorOne"), Color("ColorTwo")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}
 
#Preview {
    ContentView()
}
