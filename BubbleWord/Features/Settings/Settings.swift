//
//  Settings.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/12/22.
//

import SwiftUI

struct Settings: View {
    
    @State var soundsToggle: Bool = false
    @State var hapticsToggle: Bool = false
    @State var sensitiveContentToggle: Bool = false
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        ZStack {
            Color.appRed.ignoresSafeArea()

            VStack {
                Text("Settings")
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, Spacing.large.value)
                    .padding(.bottom, Spacing.small.value)
                
                VStack (spacing: 0){
                    HStack {
                        Text("Sounds")
                            .foregroundColor(.white)
                        Spacer()
                        Toggle("", isOn: $soundsToggle)
                            .preferredColorScheme(.dark)
                    }
                    .padding(.horizontal, Spacing.xxxs.value)
                    .padding(.vertical, Spacing.nano.value)
                    
                    Divider()
                    
                    HStack {
                        Text("Haptics")
                            .foregroundColor(.white)
                        Spacer()
                        Toggle("", isOn: $hapticsToggle)
                            .preferredColorScheme(.dark)
                    }
                    .padding(.horizontal, Spacing.xxxs.value)
                    .padding(.vertical, Spacing.nano.value)
                    
                    Divider()
                    
                    HStack {
                        Text("Sensitive Content")
                            .foregroundColor(.white)
                        Spacer()
                        Toggle("", isOn: $sensitiveContentToggle)
                            .preferredColorScheme(.dark)
                    }
                    .padding(.horizontal, Spacing.xxxs.value)
                    .padding(.vertical, Spacing.nano.value)
                    

                }
                .background(Color.black)
                .cornerRadius(CornerRadius.small.value)
                Spacer()
            }
            .padding(.horizontal, Spacing.defaultMargin.value)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
