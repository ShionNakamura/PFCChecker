import SwiftUI

struct BullyOrDietView: View {
    @State private var animate: Bool = false
    @State private var navigateToWeightView: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel


    var body: some View {
        

            ZStack {
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()
                
                VStack {

                    Spacer()

                    Text("あなたは")
                        .font(.title)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .padding(.bottom, 80)
                    

                    VStack(spacing: 75) {
               
                        Button {
                            navigateToWeightView.toggle()
                            listViewModel.bulkingOrDiet = true
                            listViewModel.goal = "これから増量します"
                              } label: {
                            Text("これから増量します")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(animate ? .red : .blue)
                                .cornerRadius(10)
                                .shadow(color: animate ? .red : .blue,
                                         radius: animate ? 30 : 10,
                                         x: 0,
                                         y: animate ? 50 : 30
                                )
                        }
                        
                        Button {
                            navigateToWeightView.toggle()
                            listViewModel.maintainWeight.toggle()
                            listViewModel.goal = "このまま維持する"

                        } label: {
                            Text("このまま維持する")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(animate ? .blue : .green)
                                .cornerRadius(10)
                                .shadow(color: animate ? .blue : .green,
                                         radius: animate ? 30 : 10,
                                         x: 0,
                                         y: animate ? 50 : 30
                                )
                        }
                        
                        Button {
                            
                            navigateToWeightView.toggle()
                            listViewModel.bulkingOrDiet = false
                            listViewModel.goal = "これから減量します"


                        } label: {
                            Text("これから減量します")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(animate ? .orange : .red)
                                .cornerRadius(10)
                                .shadow(color: animate ? .orange : .red,
                                         radius: animate ? 30 : 10,
                                         x: 0,
                                         y: animate ? 50 : 30
                                )
                        }
                    }

                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 20)
                .onAppear {
                    addAnimation()
                }
                
                .navigationDestination(isPresented: $navigateToWeightView) {
                    ConfirmationView()
                }
                .navigationTitle("目標")
            }
        
    }
    
    func addAnimation() {
        withAnimation(
            .easeInOut(duration: 2.0)
            .repeatForever()
        ) {
            animate.toggle()
        }
    }
    
    

}

#Preview {
    NavigationStack{
        BullyOrDietView()
    }
    .environmentObject(ListViewModel())
}

