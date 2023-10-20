//
//  ContentView.swift
//  BMICalculator
//
//  Created by Handy Handy on 16/04/23.
//

import SwiftUI

struct BodyMassIndexView: View {
    @StateObject var bodyMassIndexViewModel = BodyMassIndexViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker(Prompt.Title.segment,
                       selection: $bodyMassIndexViewModel.segment) {
                    Text(Prompt.Title.calculator).tag(0)
                    Text(Prompt.Title.history).tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                switch bodyMassIndexViewModel.segment {
                case 0:
                    VStack(alignment: .leading) {
                        CalculatorComponent(
                            bodyMassIndexViewModel: bodyMassIndexViewModel
                        )
                        Text("Articles")
                            .font(.title2)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        ScrollView(.horizontal) {
                            LazyHStack{
                                ForEach((1...5), id: \.self) { index in
                                    NavigationLink {
                                        DetailArticleView()
                                    } label: {
                                        ArticleViewComponent(index: index)
                                            .frame(width: UIScreen.main.bounds.size.width * 0.5, height: UIScreen.main.bounds.size.width * 0.45)
                                    }
                                    
                                }
                            }
                            
                        }
                        .padding([.leading, .trailing], 20)
                    }
                default :
                    HistoryComponent(
                        bodyMassIndexViewModel: bodyMassIndexViewModel
                    )
                }
                
            }
            .navigationTitle(Text(Prompt.Title.bodyMassIndex))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BodyMassIndexView()
    }
}
