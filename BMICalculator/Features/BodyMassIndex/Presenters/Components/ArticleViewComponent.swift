//
//  ArticleViewComponent.swift
//  BMICalculator
//
//  Created by khoirunnisa' rizky noor fatimah on 14/09/23.
//

import SwiftUI

struct ArticleViewComponent: View {
    var index: Int = 0
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("image" + "\(index)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                VStack{
                    Rectangle()
                        .fill(.clear)
                        .frame(height: geometry.size.width * 0.45)
                    ZStack {
                        Rectangle()
                            .fill(.black)
                            .opacity(0.5)
                            .frame(width: geometry.size.width, height: geometry.size.width * 0.2)
                            .cornerRadius(20)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Article Title")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(height: 5)
                                Text("Subtitle")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ArticleViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewComponent(index: 5)
    }
}
