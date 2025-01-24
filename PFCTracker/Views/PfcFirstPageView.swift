//
//  PfcFirstPageView.swift
//  PFCTracker
//
//  Created by 仲村士苑 on 2025/01/24.
//


import SwiftUI

struct PfcFirstPageView: View {
    
    @State private var animate: Bool = false
    @State private var navigateToWeightView: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        NavigationStack {  
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Quick PFC Checker")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .overlay(
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.yellow)
                                .offset(x: 10, y: -5)
                        )
                        .padding(.bottom, 30)
                    
                    Text("理想の体になりたいあなたが１日で取らないといけないPFCが30秒でわかる")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 50)
                    
                    Button(action: {
                        withAnimation {
                            navigateToWeightView.toggle()
                        }
                    }) {
                        Text("さっそく始める")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [animate ? .green : .red, .orange]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 50)
                    .onAppear {
                        addAnimation()
                    }
                    
                    Spacer()
                }
                .padding()
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
    NavigationStack {
        PfcFirstPageView()
    }
    .environmentObject(ListViewModel())
}
