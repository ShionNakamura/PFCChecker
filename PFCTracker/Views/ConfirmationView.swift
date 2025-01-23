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
                    headerView
                    Spacer()
                    userInfoView
                    Spacer()
                    decisionButton
                       
                        .padding(.top, 20)
                    
                    Spacer()
                }
             
                .navigationDestination(isPresented: $navigateToNextView) {
                    PFCResultView()
                }
                
            }
        }
    }

     var headerView: some View {
        Text("自身の情報を確認してください")
            .font(.largeTitle)
               .fontWeight(.semibold)
               .foregroundStyle(.white)
               .multilineTextAlignment(.center) // Center the text when wrapping
               .padding(.horizontal) // Add horizontal padding
               .padding(.top, 50)
    }

     var userInfoView: some View {
        VStack(alignment: .leading, spacing: 50) {
            userInfoRow(label: "性別:", value: listViewModel.gender ? "男性" : "女性")
            userInfoRow(label: "年齢:", value: "\(String(format: "%.0f", listViewModel.age))歳")
            userInfoRow(label: "身長:", value: "\(String(format: "%.0f", listViewModel.height))cm")
            userInfoRow(label: "体重:", value: "\(String(format: "%.0f", listViewModel.weight))kg")
            userInfoRow(label: "運動頻度:", value: listViewModel.frequencyWorkout)
            userInfoRow(label: "現在の目標:", value: listViewModel.goal)
        }
        .padding(.horizontal, 30)
    }

     func userInfoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.title)
                .fontWeight(.semibold)
            Text(value)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }

     var decisionButton: some View {
        Button(action: {
            navigateToNextView.toggle()
        }) {
            Text("決定")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(animate ? .green : .blue)
                .cornerRadius(30)
                .padding()
              
                .shadow(color: animate ? .green : .blue,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
        }
    }

  
}

#Preview {
    ConfirmationView()
        .environmentObject(ListViewModel())
}

