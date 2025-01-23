import SwiftUI

struct PFCResultView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    // State to control animation
    @State private var showContent = false
    @State private var navigateToNextView = false // State to control navigation

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
                    resultFontDesign(text: "あなたの１日で取らないといけないPFCの数値は...",
                                     showContent: showContent)
                        .font(.largeTitle)
                        .padding(.top, 120)

                    Spacer()
                    
                    // PFC Labels with larger font
                    VStack(alignment: .leading, spacing: 50) {
                        resultFontDesign(text: "カロリー :   \(String(format: "%.0f", listViewModel.calcCalories()))cal",
                                         showContent: showContent)
                        
                        resultFontDesign(text: "タンパク質 : \(String(format: "%.0f", listViewModel.proteinCalc()))g",
                                         showContent: showContent)
                        
                        resultFontDesign(text: "脂質 : \(String(format: "%.0f", listViewModel.fatCalc()))g",
                                         showContent: showContent)
                        
                        resultFontDesign(text: "炭水化物 : \(String(format: "%.0f", listViewModel.carboCalc()))g",
                                         showContent: showContent)
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                    
                    NavigationLink(destination: PfcFirstPageView()
                        .navigationBarBackButtonHidden(true) // Hide back button to prevent going back
                        .onAppear {
                            listViewModel.resetData() // Reset data on navigation
                        }
                    ) {
                        Text("最初の画面に戻る")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.bottom, 50)
                    }
                    .padding()
                }
            }
            .onAppear {
                withAnimation {
                    showContent = true
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the back button in this view too
    }
}

struct resultFontDesign: View {
    let text: String
    let showContent: Bool

    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .opacity(showContent ? 1 : 0)
            .offset(y: showContent ? 0 : -50)
            .animation(.easeOut(duration: 1.2), value: showContent)
    }
}

#Preview {
    NavigationStack {
        PFCResultView()
    }
    .environmentObject(ListViewModel())
}
