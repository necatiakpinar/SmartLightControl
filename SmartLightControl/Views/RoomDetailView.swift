import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    @StateObject var roomManager: RoomsViewModel
    
    @State private var isLightsToggleOn: Bool = false;
    @State private var generalLightSliderValue: Double = 50
    @Environment(\.presentationMode) var presentationMode
    
    
    private let appearanceRows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack {
            
            NavigationView(content: {
                List {
                    Spacer()
                        .listRowBackground(Color("PrimaryColor"))
                        .listRowSeparator(.hidden)
                    Spacer()
                        .listRowBackground(Color("PrimaryColor"))
                        .listRowSeparator(.hidden)
                    Spacer()
                        .listRowBackground(Color("PrimaryColor"))
                        .listRowSeparator(.hidden)
                    
                    Section(header:
                                HStack{
                        Text("Appearances")
                            .foregroundColor(.gray)
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            NavigationLink(destination: AddAppearanceView(room: $room, roomManager: roomManager)) {
                                Image(systemName: "plus")
                                    .imageScale(.small)
                            }
                            
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill(.blue)
                                .frame(width: 35, height: 35)
                            
                        )
                        .padding(.bottom, 5)
                        
                        
                    }
                    )
                    {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: appearanceRows, spacing: 10) {
                                ForEach(room.appearances) { appearance in
                                    AppearanceView(appearance: appearance)
                                    
                                }
                            }
                        }
                        .listRowBackground(Color("PrimaryColor"))
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    
                    Section(header: Text("Lights").foregroundColor(.gray))
                    {
                        LightsView(room: $room)
                    }
                    .listRowBackground(Color("PrimaryColor"))
                    .listRowSeparator(.hidden)
                    
                    Spacer()
                        .listRowBackground(Color("PrimaryColor"))
                        .listRowSeparator(.hidden)
                    
                }
                .background(Color("PrimaryColor"))
                .listStyle(PlainListStyle()) // Liste stilini özelleştirmek için listStyle kullanın
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("PrimaryColor"))
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
                                    NACircularButton(imageName: "arrow.left", action: closeView)
                                        .padding(.leading, 20)
                                    
                                    Text(room.name)
                                        .font(.callout)
                                        .bold()
                                        .foregroundStyle(LinearGradient(colors: [.white],
                                                                        startPoint: .leading, endPoint: .trailing))
                                        .padding(.leading, 20)
                                    
                                    
                                    
                                    Spacer()
                                    
                                    NACircularButton(imageName: "ellipsis", action: nil)
                                    
                                    Toggle(isOn: $isLightsToggleOn) {}
                                        .toggleStyle(SwitchToggleStyle(tint: .gray))
                                        .labelsHidden()
                                        .padding(.trailing, 20)
                                    
                                }
                                
                                //.background(.red)
                                
                                ZStack {
                                    LinearGradient(colors: [.gray, .white],
                                                   startPoint: .leading, endPoint: .trailing)
                                    
                                    //.mask(Slider(value: $generalLightSliderValue, in: 0...100))
                                    .mask(NASlider(value: $generalLightSliderValue, disabled: false))
                                    
                                    NASlider(value: $generalLightSliderValue, opacity: 0.4, disabled: false)
                                }
                                
                            }
                            
                        )
                }
                
            })
            .navigationBarHidden(true)
            
        }
        
        
    }
    
    func closeView(){
        presentationMode.wrappedValue.dismiss()
        
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        var roomManager: RoomsViewModel {
            return RoomsViewModel(rooms: BaseRoom.sampleData)
        }
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]), roomManager: roomManager)
    }
}
