import SwiftUI

struct NASlider: View {
    @Binding var value: Double
    var opacity: Double = 1.0
    var disabled: Bool = false
    var body: some View {
        Slider(value: $value, in: 0...100)
            .opacity(opacity)
            .accentColor(.white)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .onAppear {
                let progressCircleConfig = UIImage.SymbolConfiguration(scale: .medium)
                let image : UIImage? = (disabled == true) ? UIImage() : UIImage(systemName: "circle.fill", withConfiguration: progressCircleConfig)
                UISlider.appearance()
                    .setThumbImage(
                        image!, for: .normal
                        
                    )
                          
            }
            .disabled(disabled)
    }
}


struct DisableSliderBall: ViewModifier
{
    func body(content: Content) -> some View {
        content
            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

extension NASlider {
    func disableSliderBall() -> some View {
        self.modifier(DisableSliderBall())
    }
}


