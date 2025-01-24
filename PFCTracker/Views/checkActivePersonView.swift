import SwiftUI

struct CheckActivePersonView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
     
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    // Title
                    Text("あなたは日常運動しますか?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.top, 185)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("例えば...")
                        Text("• 土日のみ運動する方は。週に週に２〜３回運動するを")
                        Text("• デスクワークの場合は、少しするを選択してください。")
                        Text("• 全く運動しない場合は、全くしないを選択してください。")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 210)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    // Navigation Buttons
                    VStack(spacing: 20) {
                        // Frequently Active
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: "週6以上運動する", color: .green)
                                
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.model.activeFactor = 1.9
                                listViewModel.model.frequencyWorkout = "週6以上運動する"
                            }
                        )
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text: " 週に4~5回運動する", color: .blue)

                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.model.activeFactor = 1.725
                                listViewModel.model.frequencyWorkout =  " 週に4~5回運動する"
                            }
                        )
                        NavigationLink(
                            destination: BullyOrDietView(),
                            label: {
                                ButtonLabel(text:" 週に2~3回運動する", color: .yellow)
                                    
                            }
                            
                        )
                        
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.model.activeFactor = 1.55
                                listViewModel.model.frequencyWorkout = "週に２〜３回運動する"

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
                                listViewModel.model.activeFactor = 1.375
                                listViewModel.model.frequencyWorkout = "週に１回は運動する"

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
                                listViewModel.model.activeFactor = 1.2
                                listViewModel.model.frequencyWorkout =  "全く運動しない"

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

