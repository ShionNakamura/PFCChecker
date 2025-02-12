import SwiftUI

struct HeightView: View {
    @State private var navigateToNextView: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("自分の身長を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 110)
                
                Spacer()
                
                Text("現在の身長: \(String(format: "%.0f", listViewModel.model.height)) cm")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Slider(value: $listViewModel.model.height, in: 140...220, step: 0.1)
                    .padding(.horizontal, 40)
                    .accentColor(.blue)
                    .padding(.vertical, 20)
                
                Spacer()
                
                Button(action: {
                    navigateToNextView.toggle()
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
                
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 20)

            .navigationDestination(isPresented: $navigateToNextView) {
                WeightView()
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

