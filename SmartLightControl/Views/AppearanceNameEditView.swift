import SwiftUI

struct AppearanceNameEditView: View {
    let placeHolderString: String = "New appearance"
    @State private var isKeyboardVisible = false
    @Binding var appearanceName: String
    @Binding var isDetailViewPresented: Bool
    @State var currentApperanceName: String = ""
    
    var topBackgroundColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        HStack {
                            NACircularButton(imageName: "multiply", action: closeEditing)
                                .padding()
                            Text(placeHolderString)
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                            Button(action: finishEditing, label: {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.gray)
                                    .opacity(0.4)
                                    .frame(width: 50, height: 30)
                                    .overlay(
                                        Text("FINISH")
                                            .foregroundColor(.white)
                                            .font(.caption)
                                    )
                                    .padding()
                            })
                        }
                        .background(topBackgroundColor)

                        TextField("Enter text...", text: $currentApperanceName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .onTapGesture {
                                isKeyboardVisible = true
                            }
                            .background(GeometryReader { geometry in
                                Color.clear.onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        if isKeyboardVisible {
                                            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                    }
                                }
                            })
                        Spacer()
                    }
                )
        }
        .onAppear{
            currentApperanceName = appearanceName
        }
    }
    
    func closeEditing() {
        isDetailViewPresented = false
    }
    func finishEditing() {
        isDetailViewPresented = false
        appearanceName = currentApperanceName
    }
}

// Preview
struct AppearanceNameEditView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceNameEditView(appearanceName: .constant("Test"), isDetailViewPresented: .constant(true))
    }
}
