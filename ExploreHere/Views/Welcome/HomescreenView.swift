import SwiftUI

struct Homescreen: View {
    @State private var OnboardingScreenIsShowing = false
    @State private var IconViewIsShowing = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    TitleHome(title: "WELCOME TO HONG KONG,")
                        .padding(.leading)
                    
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
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    UserView(username: "Explore the best hotels in Hong Kong!")
                    
                    Text("Discover exclusive hotel deals and activities tailored for you.")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button(action:{
                    withAnimation{
                        IconViewIsShowing = true
                    }
                }){
                    Image("iphone120")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("TitleBackgroundColor"), lineWidth: Constants.General.lineWidth))
                }
                .sheet(isPresented: $IconViewIsShowing) {
                    IconView(IconViewIsShowing:$IconViewIsShowing)
                }
                
                // 如果需要更多内容，可以在这里添加 VStack 或 Text 等视图
                // 确保有足够内容可滚动
            }
            .padding(.vertical)
        }
        .background(
            Image("hongkong_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        )
    }
}
