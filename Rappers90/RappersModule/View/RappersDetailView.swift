//
//  RappersDetailView.swift
//  Rappers90
//
//  Created by vespro on 20/06/23.
//

import SwiftUI
import AVKit
import Kingfisher

struct RappersDetailView: View {
   var name: String
   var img: String
   var description: String
   var song: String
    
    var imgs = [
    "https://cdn.britannica.com/14/198514-050-72C159BB/Ice-Cube-2015.jpg",
    "https://i.guim.co.uk/img/media/67eec8ab7e348a4152ff3f0ea2a3fc1060f38e28/493_44_4711_2827/master/4711.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=589f464f44bbf828e4defbc819fabcae",
    "https://content.fortune.com/wp-content/uploads/2023/05/GettyImages-1403882723-e1684790057895.jpg",
    "https://yt3.googleusercontent.com/ytc/AGIKgqNUOwgJZYoeqcJpNunFyCIeoxklnN5qX4aQRM7z5w=s900-c-k-c0x00ffffff-no-rj",
    "https://media.architecturaldigest.com/photos/570e90149100f4757beb03d2/1:1/w_3160,h_3160,c_limit/Barbershop-Ice-Cube-portrait_01.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOpZmsz7rZGvazW9x6cAVyH257LZfpKfHXBQ&usqp=CAU",
    
    
    ]
    var body: some View {
       
        ZStack{
            Color("colorPrimary").ignoresSafeArea()
            VStack{
                VideoRapperView(url:song).frame(height:300)
                ScrollView{
                    VideoInfo(name:name,img:img,description:description)
                    GalleryView(imgs: imgs)
                    
                }.frame(maxWidth: .infinity)
            }
        }.ignoresSafeArea()
        
    }
}


struct VideoRapperView: View{
    var url : String
    
    var body: some View{
        let player = AVPlayer(url: URL(string: url)!)

        VideoPlayer(player: player)
            .onAppear {
                player.play()
               // player.isMuted = true
            }

    }
}


struct VideoInfo: View{
    var name: String
    var img: String
    var description: String
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                KFImage(URL(string: img)!).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle.init(cornerRadius: 40))
                .padding(.leading)
            
            Text(name).foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title)
                .padding(.leading)
                
            }
         
            Text(description)
                .foregroundColor(.white)
                .font(.caption)
                .padding(.top,6)
                .padding(.leading)
      
            
        }.frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct GalleryView: View{
    var imgs: [String]
    let formatGrid = [
        GridItem(.flexible())
    ]
    
    

    var body: some View{
        VStack(alignment: .leading){
            Text("Galeria")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
                .padding(.top,10)
            ScrollView(.horizontal){
                LazyHGrid(rows: formatGrid,spacing: 8){
                    ForEach(imgs,id:\.self){
                        img in
                        KFImage(URL(string: img)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle.init(cornerRadius: 12))
                            .padding(.bottom,12)
                    }
                }
            }.frame(height: 180).padding(.leading)
            
        }.frame(
            maxWidth: .infinity,alignment: .leading
        )
    }
}
