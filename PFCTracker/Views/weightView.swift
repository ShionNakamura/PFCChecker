import SwiftUI

struct WeightView: View {
    
    @State private var navigateToNextView: Bool = false // State to control navigation
    @EnvironmentObject var listViewModel: ListViewModel

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
                    Text("現在の体重: \(String(format: "%.1f", listViewModel.weight)) kg")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Slider(value: $listViewModel.weight, in: 40...110, step: 0.1)
                        .padding(.horizontal, 40)
                        .accentColor(.blue)
                        .padding(.vertical, 20)
                    
                    
                    Spacer()
                    
                    // Button to trigger navigation
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
                    CheckActivePersonView() // Destination view
                }
            
        }
            .navigationTitle("体重")
    }
}

#Preview {
    NavigationStack{
        WeightView()
    }
    .environmentObject(ListViewModel())

}

