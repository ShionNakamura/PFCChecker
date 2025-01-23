import SwiftUI

struct GenderView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss  // Use this to dismiss the current view
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Back Button
                    HStack {
                        Button(action: {
                            dismiss()  // Dismiss the current view
                        }) {
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        Spacer()
                    }

                    Spacer()
                    
                    // Title
                    Text("ご自身の性別を選んでください")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)

                    Spacer()
                    
                    // Navigation Buttons (Male/Female)
                    HStack(spacing: 20) {
                        NavigationLink(
                            destination: AgeView(),
                            label: {
                                Text("男性")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.gender = true
                            }
                        )
                        
                        NavigationLink(
                            destination: AgeView(),
                            label: {
                                Text("女性")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.gender = false
                            }
                        )
                    }
                    .padding(.bottom, 210) // Add space at the bottom
                }
                .padding(.horizontal, 20) // Horizontal padding for the VStack
            }
            .navigationTitle("性別")
        }
    }
}

#Preview {
    NavigationStack {
        GenderView()
    }
    .environmentObject(ListViewModel())
}

