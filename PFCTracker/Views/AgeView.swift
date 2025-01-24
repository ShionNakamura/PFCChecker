import SwiftUI

struct AgeView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showPicker: Bool = false // State to toggle picker visibility
    @State private var navigateToNextView: Bool = false // State for navigation
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
  
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        Spacer()
                    }
                    
                    .padding()

                    // Display the selected age
                    Text("選択した年齢: \(Int(listViewModel.model.age))歳")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    // Show Picker when `showPicker` is true
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
                        
                        // Done button to hide the picker
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
                        // Next button to navigate to HeightView
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
            // Navigation to HeightView
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

