//
//  VideoPlayerView.swift
//  Rappers90
//
//  Created by vespro on 15/06/23.
//


import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let player = AVPlayer(url: URL(string: "https://res.cloudinary.com/frapoteam/video/upload/v1686885133/ssstik.io_1686885125832_yz3isg.mp4")!)

    var body: some View {
        VideoPlayer(player: player)
                   .navigationBarHidden(true)
                   .navigationBarBackButtonHidden(true)
                   .ignoresSafeArea()
                   .onAppear {
                       player.play()
                   }
          
            
    }
}
