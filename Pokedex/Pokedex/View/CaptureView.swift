//
//  CaptureView.swift
//  Pokedex
//
//  Created by Matt Day on 2/15/22.
//

import SwiftUI

struct CaptureView: View {
    @Binding var capture: Bool
    var body: some View {
        HStack {
            Spacer()
            Text(capture ? "Release" : "Capture")
            Button(action: {capture.toggle()}, label: {
                Image(systemName: capture ? "tag.fill" : "tag")
                    .foregroundColor(Color.accentColor)
            })
        }
    }
}

//struct CaptureView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaptureView(capture: $true)
//    }
//}
