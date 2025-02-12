import SwiftUI

struct PFCResultView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showTitle = false
    @State private var showContent = false
    @State private var navigateToNextView = false
    @State private var showButton = false


    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                               center: .center,
                               startRadius: 5,
                               endRadius: 500)
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    resultFontDesign(text: "あなたの１日当たり取らないといけないPFCの数値の目安は...",
                                     showContent: showTitle)
                    .font(.largeTitle)
                    .padding()
                    .padding(.top, 50)
                    Spacer()
                    
                
                    
                    // PFC Labels with larger font
                    VStack(alignment: .leading, spacing: 50) {
              
                            resultFontDesign(text: "カロリー : \(String(format: "%.0f", listViewModel.calcCalories()))cal",
                                             showContent: showContent)
    
                
                        HStack {
                            resultFontDesign(text: "タンパク質 : 約\(String(format: "%.0f", listViewModel.proteinCalc()))g",
                                             showContent: showContent)
                            resultFontDesign(text: "/ \(String(format: "%.0f", listViewModel.proteinCalc()*4))cal",
                                             showContent: showContent)
                        }
                        
                        HStack {
                            resultFontDesign(text: "脂質 : 約\(String(format: "%.0f", listViewModel.fatCalc()))g",
                                             showContent: showContent)
                            resultFontDesign(text: "/ \(String(format: "%.0f", listViewModel.fatCalc()*9))cal",
                                             showContent: showContent)
                            
                        }
                        
                        HStack {
                            resultFontDesign(text: "炭水化物 : 約\(String(format: "%.0f", listViewModel.carboCalc()))g",
                                             showContent: showContent)
                            resultFontDesign(text: "/ \(String(format: "%.0f", listViewModel.carboCalc()*4))cal",
                                             showContent: showContent)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 105)
                    Spacer()
                    if showButton{
                        NavigationLink(destination: PfcFirstPageView()
                            .navigationBarBackButtonHidden(true)
                            .onAppear {
                                
                                listViewModel.resetData()
                                
                            }
                        ) {
                            Text("最初の画面に戻る")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.bottom, 50)
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showTitle = true
                                   }
                               }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation {
                        showContent = true
                    }
                }
                                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                     showButton = true
                                   }
                               }
            }
           
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct resultFontDesign: View {
    let text: String
    let showContent: Bool

    var body: some View {
        
        Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .opacity(showContent ? 1 : 0)
            .offset(y: showContent ? 0 : -50)
            .animation(.easeOut(duration: 1.2), value: showContent)
    }
}



struct procesDesign: View {
    let text: String
    let showContent: Bool

    var body: some View {
        
        Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .opacity(showContent ? 1 : 0)
            .animation(.easeOut(duration: 1.5), value: showContent)
    }
}

#Preview {
    NavigationStack {
        PFCResultView()
    }
    .environmentObject(ListViewModel())
}

