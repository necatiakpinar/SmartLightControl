import SwiftUI

struct AddAppearanceView: View {
    
    let grayColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let bottomColor: UIColor = #colorLiteral(red: 0.0483843393, green: 0.05557405449, blue: 0.1199100379, alpha: 1)
    @Binding var room: BaseRoom
    
    @State private var SliderValue: Double = 0
    @State private var isSheetPresented = false
    @State private var appearanceName = "New Appearance"
    
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        NavigationView {
            ZStack
            {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        NACircularButton(imageName: "arrow.left", action: closeView)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    HStack {
                        Circle()
                            .frame(width: 75, height: 75)
                            .padding()
                            .padding(.top, 25)
                        Spacer()
                    }
                    HStack {
                        Text(appearanceName)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                        
                        Spacer()
                        NACircularButton(imageName: "pencil", action: enableSheet)
                            .padding(.trailing, 20)
                        
                    }
                    
                    Rectangle()
                        .fill(Color(grayColor))
                        .frame(width: .infinity, height: 120)
                        .overlay(
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Appearance Brightness")
                                        .foregroundStyle(Color(.white))
                                        .font(.caption)
                                        .bold()
                                        .padding()
                                    Spacer()
                                }
                                
                                NASlider(value: $SliderValue, disabled: true)
                                
                                
                                Spacer()
                            }
                            
                        )
                    
                    
                    Rectangle()
                        .fill(Color(grayColor))
                        .frame(width: .infinity, height: 275)
                        .overlay(
                            Section(header: HStack {
                                Text("Lights")
                                    .foregroundStyle(Color(.white))
                                    .font(.caption)
                                    .bold()
                                    .padding()
                                
                                Spacer()
                            }
                                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top) // Align to the top
                                   )
                            {
                                LightsView(room: $room)
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                
                            }
                        )
                    
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(bottomColor))
                        .ignoresSafeArea()
                        .frame(width: .infinity, height: 75)
                        .overlay(
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 100, height: 40)
                                    .overlay{
                                        Text("Save")
                                            .font(.callout)
                                            .bold()
                                            .foregroundStyle(.white)
                                    }
                                
                            })
                        )
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
                AppearanceNameEditView(appearanceName: $appearanceName, isDetailViewPresented: $isSheetPresented)
            
                .presentationDetents([.medium])

        })
        .navigationBarHidden(true)
        
    }
    
    func enableSheet(){
        isSheetPresented = true
    }
        
    func closeView(){
        presentationMode.wrappedValue.dismiss()
        
    }
}


struct AddAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        AddAppearanceView(room: .constant(BaseRoom.sampleData[0]))
    }
}
