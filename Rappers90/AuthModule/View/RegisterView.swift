//
//  RegisterView.swift
//  Rappers90
//
//  Created by Fraporitmos on 15/06/23.
//

import SwiftUI


func signUp(){
    print("SIgn UP .....")

}
struct RegisterView: View{
    @State var email = ""
    @State var clave = ""
    @State var repeatClave = ""
    
    var body: some View{
        ScrollView{
            VStack(alignment:.center){
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Puedes cambiar o elegirlo mas adelante")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .padding(.bottom)
                
                Button(action: takePicture, label: {
                    ZStack{
                        Image("avatar").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }).padding(.bottom)
                
            }
            
            
            VStack(alignment:.leading){
                Group{
                    //Correo
                    Text("Correo Electronico *")
                        .foregroundColor(Color("DarkCian"))
                    ZStack(alignment: .leading){
                        if(email.isEmpty){
                            Text(verbatim: "ejemplo@gmail.com")
                                .font(.caption).foregroundColor(.gray)
                        }
                        
                        TextField("", text:$email).foregroundColor(.white)
                        
                    }
                    Divider().frame(height: 1).background( Color("DarkCian"))
                        .padding(.bottom)
                    
                    //Clave
                    Text("Contraseña *")
                        .foregroundColor(.white)
                    ZStack(alignment: .leading){
                        if(clave.isEmpty){
                            Text("Ingresa tu contraseña")
                                .font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text:$clave).foregroundColor(.white)
                        
                    }
                    Divider().frame(height: 1).background( .white)
                        .padding(.bottom)
                    
                
                    //Repeat Clave
                    Text("Confirma tu contraseña *")
                        .foregroundColor(.white)
                    ZStack(alignment: .leading){
                        if(repeatClave.isEmpty){
                            Text("Vuelve a ingresar tu contraseña")
                                .font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text:$repeatClave).foregroundColor(.white)
                        
                    }
                    Divider().frame(height: 1).background( .white)
                        .padding(.bottom)
                }
                

                
                //el infinity toma el ancho de 350 ya que lo hace automatico
                Button(action: signUp, label:  {
                    Text("Registrate").fontWeight(  .bold)
                        .foregroundColor( .white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading:18,
                                            bottom:11,trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("DarkCian"),lineWidth: 1.0).shadow(color:.white, radius: 6.0 ))
                        
                    
                }).padding(.bottom,10)
                     
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
