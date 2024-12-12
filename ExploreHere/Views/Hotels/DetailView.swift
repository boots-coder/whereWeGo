import SwiftUI
import MapKit
import Charts

struct DetailView: View {
    var hotel : Hotels
    @EnvironmentObject var hotelsList : HotelType
    
    @State private var region: MKCoordinateRegion
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "Spring"
        case summer = "Summer"
        case autumn = "Autumn"
        case winter = "Winter"
        var id: String { self.rawValue }
    }
    
    struct SeasonData: Identifiable {
        var id = UUID()
        var month: String
        var visitors: Int
        var season: Season
    }
    
    // 模拟季节性客流量数据
    let seasonalData: [SeasonData] = [
        SeasonData(month: "Mar", visitors: 18000, season: .spring),
        SeasonData(month: "Apr", visitors: 22000, season: .spring),
        SeasonData(month: "May", visitors: 25000, season: .spring),
        SeasonData(month: "Jun", visitors: 23000, season: .summer),
        SeasonData(month: "Jul", visitors: 27000, season: .summer),
        SeasonData(month: "Aug", visitors: 26000, season: .summer),
        SeasonData(month: "Sep", visitors: 20000, season: .autumn),
        SeasonData(month: "Oct", visitors: 21000, season: .autumn),
        SeasonData(month: "Nov", visitors: 17000, season: .autumn),
        SeasonData(month: "Dec", visitors: 19000, season: .winter),
        SeasonData(month: "Jan", visitors: 12000, season: .winter),
        SeasonData(month: "Feb", visitors: 15000, season: .winter),
    ]
    
    @State private var selectedSeason: Season = .spring
    
    // 定义每日价格数据结构
    struct DailyPriceData: Identifiable {
        var id = UUID()
        var day: String
        var price: Int
        var isPredicted: Bool
    }
    
    // 模拟最近一周价格数据及后两天预测价格
    let dailyPrices: [DailyPriceData] = [
        DailyPriceData(day: "Mon", price: 300, isPredicted: false),
        DailyPriceData(day: "Tue", price: 305, isPredicted: false),
        DailyPriceData(day: "Wed", price: 295, isPredicted: false),
        DailyPriceData(day: "Thu", price: 310, isPredicted: false),
        DailyPriceData(day: "Fri", price: 320, isPredicted: false),
        DailyPriceData(day: "Sat", price: 315, isPredicted: false),
        DailyPriceData(day: "Sun", price: 330, isPredicted: false),
        DailyPriceData(day: "Tomorrow", price: 340, isPredicted: true),
        DailyPriceData(day: "DayAfter", price: 345, isPredicted: true)
    ]
    
    @available(iOS 16.0, *)
    private var filteredSeasonalData: [SeasonData] {
        seasonalData.filter { $0.season == selectedSeason }
    }
    
    @available(iOS 16.0, *)
    private var predictedPrices: [DailyPriceData] {
        dailyPrices.filter { $0.isPredicted }
    }

    init(hotel: Hotels) {
        self.hotel = hotel
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        ))
    }
    
    var body: some View {
        ZStack {
            // 将地图作为背景
            Map(coordinateRegion: $region, annotationItems: [hotel]) { place in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude), tint: .red)
            }
            .opacity(0.3)
            .edgesIgnoringSafeArea(.all)
            .allowsHitTesting(false)
            
            // 前景内容
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    
                    // 酒店图片
                    Image(hotel.image)
                        .resizable()
                        .frame(width: 350, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // 酒店名称
                    Text(hotel.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                    
                    // 酒店描述
                    Text(hotel.description)
                        .tracking(-1)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 10)
                    
                    // 附近景点
                    if !hotel.nearbyAttractions.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("附近景点")
                                .font(.headline)
                                .padding(.bottom, 5)
                            
                            ForEach(hotel.nearbyAttractions, id: \.self) { attraction in
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.blue)
                                    Text(attraction)
                                        .font(.body)
                                }
                            }
                        }
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 10)
                    }
                    
                    // 注册按钮
                    Button(action: {
                        withAnimation {
                            hotelsList.addHotels(newItem: hotel)
                            print("INSERT INTO bookings (hotel_name, price) VALUES ('\(hotel.name)', \(hotel.price));")
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.blue)
                            .frame(width: 120, height: 60)
                            .overlay(
                                Text("Register")
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            )
                    }
                    .padding(.top, 20)
                    
                    // 客流量季节变化
                    Text("客流量季节变化")
                        .font(.headline)
                        .padding(.top, 30)
                    
                    Picker("Season", selection: $selectedSeason) {
                        ForEach(Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    if #available(iOS 16.0, *) {
                        Chart {
                            ForEach(filteredSeasonalData) { dataPoint in
                                BarMark(
                                    x: .value("Month", dataPoint.month),
                                    y: .value("Visitors", dataPoint.visitors)
                                )
                                .foregroundStyle(Color.blue.gradient)
                            }
                        }
                        .frame(height: 200)
                        .padding(.horizontal)
                    } else {
                        Text("Seasonal chart is available on iOS 16 and later.")
                            .foregroundColor(.gray)
                            .padding(.bottom, 30)
                    }
                    
                    // 价格趋势展示
                    Text("价格趋势（过去一周及未来预测）")
                        .font(.headline)
                        .padding(.top, 30)
                    
                    if #available(iOS 16.0, *) {
                        Chart {
                            // 实际数据的价格线
                            ForEach(dailyPrices) { priceData in
                                LineMark(
                                    x: .value("Day", priceData.day),
                                    y: .value("Price", priceData.price)
                                )
                                .foregroundStyle(priceData.isPredicted ? Color.red : Color.green)
                            }
                            
                            // 标记预测点
                            ForEach(predictedPrices) { predictedDay in
                                PointMark(
                                    x: .value("Day", predictedDay.day),
                                    y: .value("Price", predictedDay.price)
                                )
                                .symbol(Circle())    // 使用圆形符号
                                .foregroundStyle(Color.red)
                                .annotation {
                                    Text("Predicted")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .frame(height: 200)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    } else {
                        Text("Price chart is available on iOS 16 and later.")
                            .foregroundColor(.gray)
                            .padding(.bottom, 30)
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(hotel: hotelList[0])
            .environmentObject(HotelType())
    }
}

