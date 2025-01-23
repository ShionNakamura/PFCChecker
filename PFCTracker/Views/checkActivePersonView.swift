import SwiftUI

struct CheckActivePersonView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
     
            ZStack {
                // Background Gradient
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    // Title
                    Text("あなたは日常アクティブですか?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.top, 210)
                    
                    // Instructions
                    VStack(alignment: .leading, spacing: 10) {
                        Text("例えば...")
                        Text("• 立ち仕事の場合は、頻繁にするを選択してください。")
                        Text("• デスクワークの場合は、少しするを選択してください。")
                        Text("• 全く運動しない場合は、全くしないを選択してください。")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    // Navigation Buttons
                    VStack(spacing: 20) {
                        // Frequently Active
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text:  "週6以上運動する", color: .green)
                                
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.activeFactor = 1.9
                                listViewModel.frequencyWorkout = "週6以上運動する"
                            }
                        )
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: "週に4~5回運動する", color: .blue)

                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.activeFactor = 1.725
                                listViewModel.frequencyWorkout =  "週に4~5回運動する"
                            }
                        )
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: "週に２〜３回運動する", color: .yellow)
                                    
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.activeFactor = 1.55
                                listViewModel.frequencyWorkout = "週に２〜３回運動する"

                            }
                        )
                        
                        // Moderately Active
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: "週に１回は運動する", color: .orange)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.activeFactor = 1.375
                                listViewModel.frequencyWorkout = "週に１回は運動する"

                            }
                        )
                        
                        // Not Active
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: "全く運動しない", color: .red)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.activeFactor = 1.2
                                listViewModel.frequencyWorkout =  "全く運動しない"

                            }
                        )
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
            }
            .navigationTitle("運動頻度")
            .ignoresSafeArea()

        
    }
    
}

// Reusable Button Label View
struct ButtonLabel: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
}

#Preview {
    NavigationStack {
        CheckActivePersonView()
    }
    .environmentObject(ListViewModel())
}

