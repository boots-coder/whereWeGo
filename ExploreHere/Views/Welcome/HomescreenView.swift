import SwiftUI

struct Homescreen: View {
    @State private var OnboardingScreenIsShowing = false
    @State private var IconViewIsShowing = false
    @State private var selectedBannerIndex = 0
    
    // 倒计时与天气数据（示例静态值，可根据需求动态更新）
    @State private var countdown = (hours: 17, minutes: 56, seconds: 01)
    @State private var weatherIcon = "sun.max.fill"
    @State private var temperature = "25°C"
    @State private var weatherDescription = "Sunny"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                // 顶部区域：欢迎标题、倒计时、天气组件与Star Ferry图片
                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Button(action:{
                                withAnimation{
                                    OnboardingScreenIsShowing = true
                                }
                            }) {
                                RoundViews(systemName: "info")
                            }
                            .sheet(isPresented: $OnboardingScreenIsShowing) {
                                OnboardingScreen(OnboardingScreenIsShowing: $OnboardingScreenIsShowing)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // 欢迎标题
                        Text("Welcome To HK! 🇭🇰")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        // 倒计时显示
                        HStack(spacing: 8) {
                            timeBox(countdown.hours)
                            timeBox(countdown.minutes)
                            timeBox(countdown.seconds)
                        }
                        .padding(.horizontal)
                        
                        ZStack(alignment: .bottomLeading) {
                            Image("star_ferry")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .opacity(0.9)  // 增加透明度

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Star Ferry")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Enjoy the scenic journey between Wan Chai and Tsim Sha Tsui.")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(8)
                            .padding()
                        }
                    }
                    
                    // 天气组件（右上角）
                    VStack(alignment: .trailing, spacing: 4) {
                        Image(systemName: weatherIcon)
                            .font(.system(size: 24))
                            .foregroundColor(.yellow)
                        Text(temperature)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        Text(weatherDescription)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .padding([.top, .trailing])
                }
                
                // Banner区
                TabView(selection: $selectedBannerIndex) {
                    ForEach(1..<4) { i in
                        Image("hongkong_banner\(i)")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .overlay(
                                Text("Special Offer \(i)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.3))
                                    .cornerRadius(8)
                                    .padding(),
                                alignment: .bottomLeading
                            )
                            .tag(i)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 200)
                .padding(.horizontal)
                
                // 推荐酒店列表
                Text("Recommended Hotels")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(hotelList) { hotel in
                            VStack(alignment: .leading, spacing: 10) {
                                Image(hotel.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 100)
                                    .clipped()
                                    .cornerRadius(10)
                                
                                Text(hotel.name)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text("From $\(hotel.price)/night")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.yellow)
                            }
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
                
                // 旅游小贴士
                Text("Travel Tips")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 15) {
                    travelTipCard(title: "Best Time to Visit", info: "Autumn (Oct-Dec) and Spring (Mar-May) offer mild weather, ideal for exploring the city.")
                    travelTipCard(title: "Must-See Attractions", info: "Victoria Peak, Tsim Sha Tsui Promenade, and Ladies Market are top spots you don't want to miss.")
                    travelTipCard(title: "Local Cuisine", info: "Try Dim Sum, Roast Goose, and Egg Tarts at famous local eateries for an authentic Hong Kong taste.")
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 50)
            }
            .padding(.vertical)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.0, green: 0.1, blue: 0.2),
                Color(red: 0.0, green: 0.3, blue: 0.5)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .blur(radius: 2)
        )
    }
    
    // 倒计时数字块
    private func timeBox(_ value: Int) -> some View {
        Text(String(format: "%02d", value))
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(Color.black.opacity(0.25))
            .cornerRadius(4)
    }
    
    private func travelTipCard(title: String, info: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.yellow)
            Text(info)
                .font(.system(size: 14))
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(10)
    }
}
