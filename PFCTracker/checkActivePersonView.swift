import SwiftUI

struct CheckActivePersonView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    // Title
                    Text("あなた日常アクティブですか?")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)
                    
                    // Instructions
                    VStack(alignment: .leading, spacing: 10) {
                        Text("例えば...")
                        Text("もしあなたが立ち仕事の場合は、はいを選択してください。")
                        Text("もしあなたがデスクワークの場合は、いいえを選択してください。")
                        Text("もしあなたが普段1万歩以上歩くなら、はいを選択してください。")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    
                    Spacer()

                    // Navigation Buttons (Yes / No)
                    HStack(spacing: 20) {
                        NavigationLink(
                            destination: PFCResultView(), // Destination view
                            label: {
                                Text("はい")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                        )
                        
                        NavigationLink(
                            destination: PFCResultView(), // Destination view
                            label: {
                                Text("いいえ")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                        )
                    }
                    .padding(.bottom, 50) // Add space at the bottom
                }
                .padding(.horizontal, 20) // Horizontal padding for the VStack
            }
        }
    }
}

#Preview {
    CheckActivePersonView()
}

