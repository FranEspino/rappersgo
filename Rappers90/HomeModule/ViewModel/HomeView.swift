//
//  HomeView.swift
//  Rappers90
//
//  Created by vespro on 15/06/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Spacer()
            Color("colorBackground").ignoresSafeArea()
            VStack{
                HeaderHome()
                ScrollView(showsIndicators:false){
                    BannerHome()
                    SamplesHome()
                    ClasicsHome()
                }
            }.padding(.horizontal,  18)
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HeaderHome : View{
    @State var seach = ""
    var body: some View{
        HStack{
            Button(action: searchRapper,label: {
                Image(systemName: "magnifyingglass").foregroundColor(
                    seach.isEmpty ? .gray : .white)
            })
            ZStack(alignment: .leading ){
                if(seach.isEmpty){
                    Text("Busca un clasico ...").foregroundColor(.gray)
                }
                TextField("", text: $seach).foregroundColor(.white)
            }
        }.padding([.top,.leading,.bottom],11.0).background(Color("colorPrimary"))
          .clipShape(Capsule())
    }
    func searchRapper(){
        print("buscando")
    }
}


struct BannerHome: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
     @State var isPlayerActive = false
    var body: some View{
        VStack{
            Text("Lo mejor de 90'Hip Hop")
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity,
                       alignment: .leading)
                .padding(.top)
            
        }
        
        ZStack{
            Button(action: {
                url = url
                isPlayerActive = true
            }, label:   {
                
                VStack(spacing: 0){
                    Image("banner").resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("The Real Hip Hop")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(Color("colorPrimary"))
                }
            })
            
            Image(systemName: "play.circle.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 42,height: 42)
            
            
        }.frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical)
        
        //Navigation to VideoPLayerView
        
        NavigationLink(value: "playervideo" ){
                EmptyView()
        }.navigationDestination(isPresented: $isPlayerActive){
            VideoPlayerView()
        }
    }
}

struct SamplesHome: View{
    var body : some View{
        Text("The best samples")
            .fontWeight(.heavy)
            .font(.title3)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity,
                   alignment: .leading)
            .padding(.top)
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                Button(action: {}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius:  8)
                            .fill(Color("colorPrimary"))
                            .frame(width:  160, height:  90)
                        Image("vinil1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                    
                    }
                })
                Button(action: {}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius:  8)
                            .fill(Color("colorPrimary"))
                            .frame(width:  160, height:  90)
                        Image("vinil2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                    
                    }
                })
                Button(action: {}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius:  8)
                            .fill(Color("colorPrimary"))
                            .frame(width:  160, height:  90)
                        Image("vinil3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                    
                    }
                })
                
                Button(action: {}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius:  8)
                            .fill(Color("colorPrimary"))
                            .frame(width:  160, height:  90)
                        Image("vinil4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                    }
                })
            }
        }.padding(.bottom)
    }
}


struct ClasicsHome:View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                Button(action: {}, label:   {
                    Image("clasic0").resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 120)
                })
                Button(action: {}, label:   {
                    Image("clasic2").resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 150)
                })
                Button(action: {}, label:   {
                    Image("clasic1").resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 130)
                })
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HomeView().previewDevice("iPhone 11")
        }
    }
}
