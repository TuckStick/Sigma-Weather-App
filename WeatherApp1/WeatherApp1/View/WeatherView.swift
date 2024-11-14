import Combine
import Foundation

class WeatherView: ObservableObject {

    @Published var weatherResponce: WeatherResponce?
    @Published var errorMessage: String?

    private var cancellable: AnyCancellable?
    private let apiKey = "5f3f81ae840248b98f8153408241410"
    private var defaultCity = "Tulsa"
    
    init() {
        fetchWeather(for: defaultCity)
        
    }
    func fetchWeather(for cityName: String) {
        let urlString =
            "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(cityName)&days=3"
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid city name."
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .handleEvents(receiveOutput: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(jsonString)")
                }
            })
            .decode(type: WeatherResponce.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        self.errorMessage =
                            "Error fetching weather data: \(error.localizedDescription)"
                        print("Error: \(error)")
                    case .finished:
                        break
                    }
                },
                receiveValue: { response in
                    print("Weather response: \(response)")
                    self.weatherResponce = response
                    self.errorMessage = nil
                })
    }
}
