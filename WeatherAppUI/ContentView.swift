//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by George on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isDay = true
    var body: some View {
        ZStack {
            
            BackGroundView(isDay: $isDay)
            VStack(spacing : 4){
                CityNameView(name :"Cupertino, CA")
                TodaysWeatherView(imageName : isDay ? "cloud.sun.fill" : "moon.stars.fill", temperature : 66)
                
                HStack(spacing : 12){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 51 )
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunrise.fill", temperature: 70)
                }
                
                Spacer()
                Button("Change time of day"){
                    isDay.toggle()
                }.frame(width: 280, height: 80).background(Color(.white)).font(.title).cornerRadius(15)
                Spacer()
            }
            
        }
    }
}

#Preview("Weather App  Main Screen") {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.title2).foregroundStyle(.white)
            Image(systemName: imageName ).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            Text("\(temperature)°").font(.largeTitle).foregroundStyle(.white)
        }
    }
}

struct BackGroundView : View {
    @Binding var isDay : Bool
    var body: some View {
        LinearGradient(colors: [isDay ? .blue : .black, isDay ? Color("LightBlueLinearGradientEnd") : .gray], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct CityNameView: View {
    var name : String
    var body: some View {
        Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white).padding(.top  )
    }
}

struct TodaysWeatherView: View {
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack{
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 160, height: 150)
            Text("\(temperature)°").font(.largeTitle).foregroundStyle(.white)
        }.padding(.bottom, 120)
    }
}
