import SwiftUI

struct HeightView: View {
    @State private var navigateToNextView: Bool = false // State to control navigation
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss

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
                Text("自分の身長を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 110)
                
                Spacer()
                
                Text("現在の身長: \(String(format: "%.0f", listViewModel.height)) cm")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Slider(value: $listViewModel.height, in: 140...220, step: 0.1)
                    .padding(.horizontal, 40)
                    .accentColor(.blue)
                    .padding(.vertical, 20)
                
                Spacer()
                
                // Button to trigger navigation to the next view (WeightView)
                Button(action: {
                    navigateToNextView.toggle() // Set state to true on button click
                }, label: {
                    Text("次へ")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.bottom, 50)
                })
                
                .padding(.bottom, 60) // Add some bottom padding for button
            }
            .padding(.horizontal, 20) // Horizontal padding for the whole VStack

            // Navigation when navigateToNextView is true
            .navigationDestination(isPresented: $navigateToNextView) {
                WeightView() // Destination view
            }

        }
        .navigationTitle("身長")
    }
}

#Preview {
    NavigationStack{
        HeightView()
    }
    .environmentObject(ListViewModel())
}

