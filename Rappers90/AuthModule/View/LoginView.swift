//
//  LoginView.swift
//  Rappers90
//
//  Created by Fraporitmos on 15/06/23.
//

import SwiftUI





struct LoginView: View{
    @State var correo = ""
    @State var password = ""
    @State var isHomeScreenActive = false
    
    var body: some View{
        ScrollView{
            VStack(alignment:.leading){
                //Correo
                Text("Correo Electronico")
                    .foregroundColor(Color("DarkCian"))
                ZStack(alignment: .leading){
                    if(correo.isEmpty){
                        Text(verbatim: "ejemplo@gmail.com")
                            .font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text:$correo).foregroundColor(.white)
                    
                }
                Divider().frame(height: 1).background( Color("DarkCian"))
                    .padding(.bottom)
                
                //Clave
                Text("Clave")
                    .foregroundColor(.white)
                ZStack(alignment: .leading){
                    if(correo.isEmpty){
                        Text("Ingresa tu clave")
                            .font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text:$password).foregroundColor(.white)
                    
                }
                Divider().frame(height: 1).background( .white)
                    .padding(.bottom)
                
                Text("Olvidaste tu contrasena?").font(.footnote)
                    .frame(width:  350, alignment: .trailing)
                    .foregroundColor(Color("DarkCian"))
                    .padding(.bottom)
                //el infinity toma el ancho de 350 ya que lo hace automatico
                
                Button(action: signIn, label:  {
                    Text("Iniciar Sesion").fontWeight(  .bold)
                        .foregroundColor( .white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading:18,
                                            bottom:11,trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("DarkCian"),lineWidth: 1.0).shadow(color:.white, radius: 6.0 ))
                        
                    
                }).padding(.bottom,60)

            }
            NavigationLink(value: "tabnavigation" ){
                    EmptyView()
            }.navigationDestination(isPresented: $isHomeScreenActive){
                TabNavigation()
            }
               
        }
    }
    
    func signIn(){
        
        isHomeScreenActive = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

