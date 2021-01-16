//
//  ContentView.swift
//  binding_48
//
//  Created by User05 on 2020/12/4.
//

import SwiftUI

struct ContentView: View {
    @State private var showingbodyOptions = 0
    @State private var themeColor = Color(red: 178/255, green: 34/255, blue: 34/255)
    @State private var gender : String = ""
    @State private var user_name : String = ""
    @State private var selectedIndex_gender = 0
    @State private var birthday = Date()
    @State private var height : CGFloat = 170.0
    @State private var weight : CGFloat = 70.0
    @State private var reach : CGFloat = 190.0
    
    var body: some View {
        NavigationView {
            VStack{
                Text("  選手變身器  ")
                    .bold()
                    .font(.system(size:40))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black,lineWidth: 5))
                    .offset(y:-30)
                Form{
                    if showingbodyOptions == 0{//first part
                        VStack{
                            HStack{
                                Spacer()
                                Text("請告訴我您的基本資料\n讓我把您變成格鬥選手")
                                Spacer()
                            }
                            ColorPicker("主題顏色",selection: $themeColor)
                            Text("您的名字")
                            TextField("OOO",text: $user_name)
                                .padding()
                            Text("您的性別")
                            Picker(selection: $selectedIndex_gender,label : Text("性別")){
                                Text("男").tag(0)
                                Text("女").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        }
                        VStack{
                            DatePicker("您的生日", selection: $birthday, displayedComponents: .date)
                                .accentColor(themeColor)
                                .padding()
                            HStack {
                                Spacer()
                                Button(action:{
                                        showingbodyOptions = 1
                                    })
                                {
                                    Text("確  認")
                                        .bold()
                                        .font(.title2)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(themeColor)
                                        .cornerRadius(25)
                                        .shadow(color: .gray, radius: 5, x:2, y:4)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                    }
                    if showingbodyOptions == 1{// second part
                        VStack{
                            HStack {
                                Spacer()
                                Button(action:{
                                        showingbodyOptions = 0
                                    })
                                {
                                    Text("返  回")
                                        .bold()
                                        .font(.title2)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(themeColor)
                                        .cornerRadius(25)
                                        .shadow(color: .gray, radius: 5, x:2, y:4)
                                }
                                Spacer()
                            }
                            .padding()
                            HStack{
                                Spacer()
                                Text("\(user_name)你好！請告訴我你的身體素質")
                                Spacer()
                            }
                        }
                        VStack{
                            HStack{
                                Text("身高")
                                Slider(value: $height, in:0...200, step:10, minimumValueLabel:Text("0"), maximumValueLabel:Text("200")){
                                    Text("")
                                }
                                .accentColor(themeColor)
                            }
                            HStack{
                                Spacer()
                                Text("身高是\(height, specifier: "%g")公分")
                                Spacer()
                                Stepper(value: $height){}
                            }
                            HStack{
                                Text("體重")
                                Slider(value: $weight, in:0...120, step:10, minimumValueLabel:Text("0"), maximumValueLabel:Text("120")){
                                    Text("")
                                }
                                .accentColor(themeColor)
                            }
                            HStack{
                                Spacer()
                                Text("體重是\(weight, specifier: "%g")公斤")
                                Spacer()
                                Stepper(value: $weight){}
                            }
                            HStack{
                                Text("臂展")
                                Slider(value: $reach, in:0...210, step:10, minimumValueLabel:Text("0"), maximumValueLabel:Text("210")){
                                    Text("")
                                }
                                .accentColor(themeColor)
                            }
                            HStack{
                                Spacer()
                                Text("臂展是\(reach, specifier: "%g")公分")
                                Spacer()
                                Stepper(value: $reach){}
                            }
                        }
                        VStack{
                            HStack{
                                Spacer()
                                Text("確認後請按\"查看量級\"")
                                Spacer()
                            }
                            NavigationLink(destination:weight_page(weight: weight, gender: selectedIndex_gender, themecolor: themeColor)){
                                Button(action:{})
                                {
                                    Text("查看量級")
                                        .bold()
                                        .font(.title2)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(themeColor)
                                        .cornerRadius(25)
                                        .shadow(color: .gray, radius: 5, x:2, y:4)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .foregroundColor(themeColor)
                .opacity(0.95)
                .offset(y:-10)
            }
            .background(Image("bg").resizable().opacity(0.8).frame(height:1000))
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
