//
//  ConfirmationView.swift
//  PFCTracker
//
//  Created by 仲村士苑 on 2025/01/19.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var navigateToNextView: Bool = false
    @State private var animate: Bool = false
    @State private var showConfirmationAlert: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 30) {
                    headerView
                    userInfoView
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)

                    Spacer()
                    decisionButton
                        .padding(.top,20)
                    
                }
                .padding(.horizontal, 20)  // General padding for consistency
                .frame(maxHeight: .infinity, alignment: .top)
                .navigationDestination(isPresented: $navigateToNextView) {
                    PFCResultView()
                }
            }
        }
        .alert( isPresented:$showConfirmationAlert ){
            Alert(
                title: Text("最終確認"),
                message: Text("全てのご自身の情報が間違ってないですか。"),
                primaryButton: .destructive(Text("決定")) {
                                    navigateToNextView.toggle() // Proceed to the next view if "Yes" is tapped
                                },
                secondaryButton: .cancel()
            )
        }
    }

   private var headerView: some View {
        Text("ご自身の最終情報")
            .font(.largeTitle)
               .fontWeight(.semibold)
               .foregroundStyle(.white)
               .multilineTextAlignment(.center) // Center the text when wrapping
               .padding(.horizontal) // Add horizontal padding
               .padding(.top, 50)
    }

    private var userInfoView: some View {
        ScrollView{

            VStack(alignment: .leading, spacing: 50) {
                userInfoRow(label: "性別:", value: listViewModel.model.gender ? "男性" : "女性")
                userInfoRow(label: "年齢:", value: "\(String(format: "%.0f", listViewModel.model.age))歳")
                userInfoRow(label: "身長:", value: "\(String(format: "%.0f", listViewModel.model.height))cm")
                userInfoRow(label: "体重:", value: "\(String(format: "%.0f", listViewModel.model.weight))kg")
                userInfoRow(label: "運動頻度:", value: listViewModel.model.frequencyWorkout)
                userInfoRow(label: "現在の目標:", value: listViewModel.model.goal)
                
            }
            .padding(.horizontal, 30)
        }
    }
    private func userInfoRow(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.title)
                .fontWeight(.semibold)
            Text(value)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
    

    private var decisionButton: some View {
        Button(action: {
//            navigateToNextView.toggle()
            showConfirmationAlert.toggle()
        }) {
            Text("結果を見る")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(animate ? .green : .blue)
                .cornerRadius(30)
                .padding()
                .shadow(color: animate ? .green : .blue,
                        radius: 30,
                        x: 0,
                        y:  50 )
                .animation(.easeInOut(duration: 2.0).repeatForever(), value: animate)  // Applied animation here

        }
        .onAppear {
              animate.toggle()
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
    ConfirmationView()
        .environmentObject(ListViewModel())
}

