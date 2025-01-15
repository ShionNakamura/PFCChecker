import SwiftUI

struct PFCResultView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    // Title
                    Text("あなたの１日で取らないといけないPFCの数値は?")
                        .lineLimit(2)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.top, 50) // Added top padding for balance
                    
                    Spacer() // Spacing between title and next content
                    
                    // PFC Labels with larger font
                    VStack(alignment: .leading, spacing: 50) {
                        Text("タンパク質 :")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text("脂質 :")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text("炭水化物 :")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 30) // Horizontal padding to prevent sticking to the sides
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()



                }
            }
        }
    }
}

#Preview {
    PFCResultView()
}

