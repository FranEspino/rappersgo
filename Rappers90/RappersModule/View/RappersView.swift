//
//  RappersView.swift
//  Rappers90
//
//  Created by vespro on 19/06/23.
//
import SwiftUI
import Kingfisher

struct RappersView: View {
    @ObservedObject var allrappers = RappersViewModel()
    
    @State var isPlayerActive = false
    @State var rappeersIsActive: Bool = false
    @State var name: String = ""
    @State var img: String = ""
    @State var description: String = ""
    @State var song: String = ""

    
    let formaGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    
    var body: some View {
        ZStack{
            Color("colorPrimary")
            
            VStack{
                Text("Rappers Old School")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.top,70)
                    
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        ForEach(allrappers.rappers,id: \.self){
                            rapper in
                            Button(
                            action:{
                                name =  rapper.name
                                description = rapper.description
                                img = rapper.img
                                song = rapper.song
                                isPlayerActive = true
                            },
                            label: {
                                KFImage(URL(string: rapper.img)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 12))
                                    .padding(.bottom,12)
                                
                            })
                            
                        }
                    }.padding(.bottom, 100)
                }
           }.padding(.horizontal,6)
            //Navigation to Detail Rappers
            
            NavigationLink(value: "DetailtRappersView" ){
                    EmptyView()
            }.navigationDestination(isPresented: $isPlayerActive){
                RappersDetailView(
                    name: name,
                    img: img,
                    description: description,
                    song: song
                )
            }
            
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    //print(allrappers.rappers)
                }
            )
    }
}


struct RappersView_Previews: PreviewProvider {
    static var previews: some View {
        RappersView()
    }
}

