import SwiftUI

struct OnboardingScreen_Watch: View {
    @Binding var OnboardingScreenIsShowing: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Explore")
                .font(.title2)
                .bold()
                .foregroundColor(.yellow)
                .multilineTextAlignment(.center)
            
            // 减小图片尺寸
            Image("Sydney")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            // 简化文字信息
            Text("Plan trips, choose hotels,\nshare expenses, and enjoy!")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // 简单的关闭按钮
            Button(action: {
                OnboardingScreenIsShowing = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(
            LinearGradient(colors: [.blue, .gray],
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
        )
        .cornerRadius(10)
        .padding()
    }
}
