import SwiftUI

struct Homescreen_Watch: View {
    @State private var OnboardingScreenIsShowing = false
    
    // 简化后的数据：只保留核心倒计时与天气数据
    @State private var countdown = (hours: 17, minutes: 56, seconds: 1)
    @State private var weatherIcon = "sun.max.fill"
    @State private var temperature = "25°C"
    @State private var weatherDescription = "Sunny"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                
                // 顶部区域：信息按钮 & 倒计时 & 天气
                HStack {
                    Button(action: {
                        withAnimation {
                            OnboardingScreenIsShowing = true
                        }
                    }) {
                        // 精简的按钮样式（减少尺寸）
                        Image(systemName: "info.circle")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }
                    .sheet(isPresented: $OnboardingScreenIsShowing) {
                        OnboardingScreen_Watch(OnboardingScreenIsShowing: $OnboardingScreenIsShowing)
                    }
                    
                    Spacer()
                    
                    // 天气信息（右上角）
                    VStack(alignment: .trailing, spacing: 2) {
                        Image(systemName: weatherIcon)
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                        Text(temperature)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        Text(weatherDescription)
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                
                // 倒计时简单显示
                HStack(spacing: 4) {
                    timeBox(countdown.hours)
                    timeBox(countdown.minutes)
                    timeBox(countdown.seconds)
                }
                
                // 精简后的图片展示：只显示一张代表性图片
                Image("star_ferry")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80) // 手表屏幕较小
                    .cornerRadius(8)
                
                // 少量文字描述（减少篇幅）
                Text("WelCome Hk")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Enjoy a scenic ferry ride!")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // 精简后不再展示 Banner 和酒店列表，只给出简单提示
                Text("Quick Tips")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.yellow)
                
                travelTipCard(title: "Best Time", info: "Autumn and Spring.")
                Spacer()
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [
                Color.black,
                Color.blue
            ]), startPoint: .top, endPoint: .bottom)
        )
    }
    
    // 时间显示格子保持简化
    private func timeBox(_ value: Int) -> some View {
        Text(String(format: "%02d", value))
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(4)
            .background(Color.black.opacity(0.25))
            .cornerRadius(4)
    }
    
    // 简化后的tip卡片
    private func travelTipCard(title: String, info: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.yellow)
            Text(info)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .padding(6)
        .background(Color.black.opacity(0.3))
        .cornerRadius(8)
    }
}
