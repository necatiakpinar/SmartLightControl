import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    @State private var isLightsToggleOn: Bool = false;
    @State private var generalLightSliderValue: Double = 50
    
    private let appearanceRows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack {
            
            NavigationView(content: {
                List {
                    Spacer()
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .listRowSeparator(.hidden)
                    Spacer()
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .listRowSeparator(.hidden)
                    Spacer()
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .listRowSeparator(.hidden)
                    
                    Section(header: Text("Appearances"))
                    {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: appearanceRows, spacing: 10) {
                                ForEach(room.appearances) { appearance in
                                    AppearanceView(appearance: appearance)
                                    
                                }
                            }
                        }
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    
                    Section(header: Text("Lights"))
                    {
                        ScrollView(.horizontal, showsIndicators: false)
                        {
                            LazyHGrid(rows: lightRows, spacing: 10, content: {
                                ForEach(room.lights) { light in
                                    LightView(light: light)
                                    
                                }
                            })
                        }
                        .background(Color(UIColor.systemGroupedBackground))
                        
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowSeparator(.hidden)
                    
                    Spacer()
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .listRowSeparator(.hidden)
                    
                }
                .background(Color(UIColor.systemGroupedBackground))
                .listStyle(PlainListStyle()) // Liste stilini özelleştirmek için listStyle kullanın
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.systemGroupedBackground))
                .ignoresSafeArea()
                .safeAreaInset(edge: .top ) {
                    Rectangle()
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.orange)
                        .overlay(
                            VStack
                            {
                                HStack
                                {
                                    Button {
                                        print("Button was tapped")
                                    } label: {
                                        Image(systemName: "arrow.left")
                                            .imageScale(.small)
                                        
                                    }
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .background(
                                        Circle()
                                            .fill(.gray).opacity(0.4)
                                            .frame(width: 35, height: 35)
                                        
                                    )
                                    .padding(.leading, 20)
                                    
                                    Text(room.name)
                                        .font(.callout)
                                        .bold()
                                        .foregroundStyle(LinearGradient(colors: [.white],
                                                                        startPoint: .leading, endPoint: .trailing))
                                        .padding(.leading, 20)
                                    
                                    
                                    
                                    Spacer()
                                    Button {
                                        print("Button was tapped")
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .imageScale(.small)
                                        
                                    }
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .background(
                                        Circle()
                                            .fill(.gray).opacity(0.4)
                                            .frame(width: 35, height: 35)
                                        
                                    )
                                    .padding()
                                    
                                    Toggle(isOn: $isLightsToggleOn) {}
                                        .toggleStyle(SwitchToggleStyle(tint: .gray))
                                        .labelsHidden()
                                        .padding(.trailing, 20)
                                    
                                }
                            
                                //.background(.red)
                                
                                ZStack {
                                    LinearGradient(colors: [.gray, .white],
                                                                    startPoint: .leading, endPoint: .trailing)
                                    
                                    .mask(Slider(value: $generalLightSliderValue, in: 0...100))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    
                                    Slider(value: $generalLightSliderValue, in: 0...100)
                                        .opacity(0.5)
                                        .accentColor(.white)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 20)
                                        .onAppear {
                                            let progressCircleConfig = UIImage.SymbolConfiguration(scale: .medium)
                                            UISlider.appearance()
                                                .setThumbImage(UIImage(systemName: "circle.fill",
                                                                       withConfiguration: progressCircleConfig), for: .normal)
                                        }
                                }
                                
                            }
                            
                        )
                }
                
            })
            .navigationBarHidden(true)
            
        }
        
        
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
