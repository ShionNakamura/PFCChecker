import SwiftUI

struct WeightView: View {
    @State private var weight: Double = 50

    var body: some View {
        ZStack {
            // Background Gradient
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
                .ignoresSafeArea()

            VStack {
                // Title
                Text("自分の体重を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 50)
                
                Spacer()

                Text("現在の体重: \(String(format:"%.0f", weight)) kg")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
           
                Slider(value: $weight, in: 40...110, step: 1)
                    .padding(.horizontal, 40)
                    .accentColor(.white)
                    .padding(.vertical, 20)
                
                Spacer()
                
                Button(action: {
                    // Action for "決定"
                }, label: {
                    Text("決定")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.bottom, 50)
                })
                
                .padding(.bottom, 60) // Add some bottom padding for button

            }
            .padding(.horizontal, 20) // Horizontal padding for the whole VStack
        }
    }
}

#Preview {
    WeightView()
}

