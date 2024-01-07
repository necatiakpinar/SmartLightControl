import SwiftUI

struct AddAppearanceView: View {
    
    let grayColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    var body: some View {
        ZStack
        {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    NACircularButton(imageName: "arrow.left")
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
                    Text("New Appearance")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
    
                    Spacer()
                    NACircularButton(imageName: "pencil")
                        .padding(.trailing, 20)
    
                }
                
                Rectangle()
                    .fill(Color(grayColor))
                    .frame(width: .infinity, height: 150)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Test")
                                .foregroundStyle(Color(.white))
                        }
                            //.alig
                        
                    )
                    
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct AddAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        AddAppearanceView()
    }
}
