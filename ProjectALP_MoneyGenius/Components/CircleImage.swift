//
//  CircleImage.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 30/05/23.
//

import SwiftUI

struct CImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 0))
            .shadow(radius: 0)
    }
}

struct CImage_Previews: PreviewProvider {
    static var previews: some View {
        CImage(image: Image("Ellipse"))
    }
}
