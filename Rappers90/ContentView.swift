//
//  ContentView.swift
//  Rappers90
//
//  Created by Fraporitmos on 15/06/23.
//

import SwiftUI

func takePicture(){
    print("Take Photo .....")
    
}

func signSocialMedia(){
    print("Take Photo .....")
    
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Spacer()
                Color("colorBackground").ignoresSafeArea()
                VStack{
                    Image("logo").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150 ).padding(.bottom,20)
                    BodyLoginView()
                }
                
            }
        }
    }
}


struct BodyLoginView : View{
    //property wrapper
    @State var typeLogin = true
    
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Button("INICIA SESION") {
                        typeLogin = true
                        print("pantalla inicio de sesion")
                    }.foregroundColor( typeLogin ? .white : .gray)
                    
                    if(typeLogin){
                        Divider().frame(width: 120,height: 2).background(.white)
                    }
                }
                
                Spacer()
                VStack{
                    Button("REGISTRATE") {
                        typeLogin = false
                        print("pantalla inicio de registrate")
                    }.foregroundColor( typeLogin ? .gray : .white)
                    if(!typeLogin){
                        Divider().frame(width: 120,height: 2).background(.white)
                    }
                    
                }
            
            }
            
            Spacer(minLength:42)
            
            if(typeLogin){
                LoginView()
            }else{
                RegisterView()
            }
            
            VStack{
                HStack{
                    Button(action: signSocialMedia, label:{
                        Text( "Facebook").foregroundColor( .white)
                            .fontWeight(  .black)
                            .padding(EdgeInsets(top: 5, leading:37,
                                                bottom:5,trailing: 37))
                            .background(Color("colorPrimary"))
                            .clipShape(RoundedRectangle(cornerRadius:   4.0))
                        
                    })
                    
                    Button(action: signSocialMedia, label:{
                        Text( "Twitter").foregroundColor( .white)
                            .fontWeight(  .black)
                            .padding(EdgeInsets(top: 5, leading:37,
                                                bottom:5,trailing: 37))
                            .background(Color("colorPrimary"))
                            .clipShape(RoundedRectangle(cornerRadius:   4.0))
                    })
                    
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }
        }.padding( .horizontal, 30.0)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
