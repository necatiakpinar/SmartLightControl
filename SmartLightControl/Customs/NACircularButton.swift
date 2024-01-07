import SwiftUI

struct NACircularButton: View {
    var imageName: String
    var action: (() -> Void)?
    var opacity: Double = 0.4
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: imageName)
                .imageScale(.small)
            
        }
        .font(.title)
        .foregroundColor(.white)
        .background(
            Circle()
                .fill(.gray).opacity(opacity)
                .frame(width: 35, height: 35)
            
        )

    }
}
