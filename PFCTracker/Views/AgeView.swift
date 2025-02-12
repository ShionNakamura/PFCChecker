//
//  AgeView.swift
//  PFCTracker
//
//  Created by 仲村士苑 on 2025/02/12.
//

import SwiftUI

struct AgeView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showPicker: Bool = false
    @State private var navigateToNextView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
  
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                        Button(action: {
                            dismiss()
                        }) {
                        }
                    .padding()

                    Text("選択した年齢: \(Int(listViewModel.model.age))歳")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    if showPicker {
                        Picker("年齢を選択", selection: $listViewModel.model.age
                        ) {
                            ForEach(16...100, id: \.self) { number in
                                Text("\(number)")
                                    .tag(Double(number))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 200)
                        .clipped()
                        
                        Button(action: {
                            withAnimation {
                                showPicker.toggle()
                            }
                        }) {
                            Text("完了")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)
                                
                        }
                        .padding()
                    }
                    
                    if !showPicker{
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                                showPicker.toggle()
                            }
                        }) {
                            Text("自分の年齢を選択")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .cornerRadius(20)
                                
                        }
                        .padding()
                        Button(action: {
                            navigateToNextView.toggle()
                        }) {
                            Text("次へ")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .padding(.top, 200)
                    }
                }
                .padding()

            }
            .navigationTitle("年齢")
            .navigationDestination(isPresented: $navigateToNextView) {
                HeightView()
            }
        }
    
}

#Preview {
    NavigationStack {
        AgeView()
    }
    .environmentObject(ListViewModel())
}

