import SwiftUI

struct GenderView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        Spacer()
                    }

                    Spacer()
                    
                    Text("ご自身の性別を選んでください")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)

                    Spacer()
                    
                    HStack(spacing: 20) {
                        NavigationLink(
                            destination: AgeView(),
                            label: {
                                genderBox(text: "男性")
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.model.gender = true
                            }
                        )
                        
                        NavigationLink(
                            destination: AgeView(),
                            label: {
                                genderBox(text: "女性")
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        )
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                listViewModel.model.gender = false
                            }
                        )
                    }
                    .padding(.bottom, 210)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("性別")
        }
    }
    func genderBox(text: String) -> some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .padding()
    }
}

#Preview {
    NavigationStack {
        GenderView()
    }
    .environmentObject(ListViewModel())
}

