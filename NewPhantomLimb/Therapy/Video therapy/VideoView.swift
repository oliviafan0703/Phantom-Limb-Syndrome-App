//
//  VideoView.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/5/21.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
   
    let viewID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        //guard let youtubeURL = URL (string: "https://www.youtube.com/embed/\(viewID)")
        
        guard let youtubeURL = URL (string: "https://www.youtube.com/embed/\(viewID)")
        else{
            return
        }
        //make sure the webview is nnot scrollable
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
