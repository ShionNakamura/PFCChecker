import SwiftUI

struct BullyOrDietView: View {
    @State private var animate: Bool = false
    @State private var navigateToWeightView: Bool = false

    var body: some View {
        
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()
                
                VStack {
                    Text("PFC Checker \(Image(systemName: "checkmark.seal.fill"))")
                        .font(.title)
                        .padding(.top, 70)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("あなたは")
                        .font(.title)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                    
                    Spacer()

                    VStack(spacing: 75) {
               
                        Button {
                            navigateToWeightView.toggle()
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
                        } label: {
                            Text("これから減量します")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(animate ? .blue : .red)
                                .cornerRadius(10)
                                .shadow(color: animate ? .blue : .red,
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
                    WeightView()
                }
            }
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
    BullyOrDietView()
}

