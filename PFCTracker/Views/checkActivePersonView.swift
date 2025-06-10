import SwiftUI

struct CheckActivePersonView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
     
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    Text("普段のあなたの運動の頻度は?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.top, 185)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("例えば...")
                        Text("• 土日のみ運動する方は、週に２〜３回運動するを。")
                        Text("• 平日の１日の平均歩数計が約8000歩以上であれば週に4〜5回運動するを。")
                        Text("• 全く日常で動かなく１日の平均歩数計が約2000歩以下なら、全くしないを。")
                        
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
                    ScrollView{
                        VStack(spacing: 20) {
                            // Frequently Active
                            NavigationLink(
                                destination: BullyOrDietView(),
                                label: {
                                    ButtonLabel(text: "週6回以上", color: .green)
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
                                    ButtonLabel(text: " 週に4~5回", color: .blue)
                                    
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
                                    ButtonLabel(text:" 週に2~3回", color: .yellow)
                                }
                            )
                            .simultaneousGesture(
                                TapGesture().onEnded {
                                    listViewModel.model.activeFactor = 1.55
                                    listViewModel.model.frequencyWorkout = "週に２〜３回運動する"
                                    
                                }
                            )
                            NavigationLink(
                                destination: BullyOrDietView(),
                                label: {
                                    ButtonLabel(text: "週に１回", color: .orange)
                                }
                            )
                            .simultaneousGesture(
                                TapGesture().onEnded {
                                    listViewModel.model.activeFactor = 1.375
                                    listViewModel.model.frequencyWorkout = "週に１回は運動する"
                                    
                                }
                            )
                            NavigationLink(
                                destination: BullyOrDietView(),
                                label: {
                                    ButtonLabel(text: "全くしない", color: .red)
                                }
                            )
                            .simultaneousGesture(
                                TapGesture().onEnded {
                                    listViewModel.model.activeFactor = 1.2
                                    listViewModel.model.frequencyWorkout =  "全く運動しない"
                                    
                                }
                            )
                        }
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


