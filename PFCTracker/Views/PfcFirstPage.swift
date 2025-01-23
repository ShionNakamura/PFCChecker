//
//  PfcFirstPage.swift
//  PFCTracker
//
//  Created by 仲村士苑 on 2025/01/17.
//

import SwiftUI

struct PfcFirstPageView: View {
    
    @State private var animate: Bool = false
    @State private var navigateToWeightView: Bool = false
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Quick PFC Checker \(Image(systemName: "checkmark.seal.fill"))")
                        .font(.title)
                        .padding(.top, 70)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("あなたの１日で取らないといけないPFCが30秒でわかる")
                        .font(.title)
                        .lineLimit(5)
                        .foregroundStyle(.white)
                    
                    Spacer()

                    VStack(spacing: 75) {
               
                        Button {
                            withAnimation(){
                                navigateToWeightView.toggle()
                            }
                        } label: {
                            Text("さそっく始める")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(animate ? .green : .red)
                                .cornerRadius(10)
                                .shadow(color: animate ? .green : .red,
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
                    GenderView()
             }
            }
        }
    }
   private func addAnimation() {
        withAnimation(
            .easeInOut(duration: 2.0)
            .repeatForever()
        ) {
            animate.toggle()
        }
    }
}

#Preview {
    NavigationStack
    {
    PfcFirstPageView()
}
.environmentObject(ListViewModel())
}
