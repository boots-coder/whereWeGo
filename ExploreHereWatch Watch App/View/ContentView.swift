import SwiftUI

struct ContentView: View {
    @EnvironmentObject var hotelType : HotelType
    @State private var ListScreenIsShowing = false

    var body: some View {
        // 使用 TabView + page 样式来实现左右滑动切换页面的效果
        TabView {
            // 欢迎主界面
            Homescreen_Watch()
            
            // 酒店列表界面
            ListScreen(ListScreenisShowing: $ListScreenIsShowing)
        }
        .tabViewStyle(.page)
        // 不再使用 iOS 特有的 .accentColor 或 tabItem
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 此处需要提供相应的 environmentObject
        // 比如：
        ContentView()
            .environmentObject(HotelType())
    }
}
