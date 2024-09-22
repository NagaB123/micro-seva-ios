//
//  SignUpView.swift
//  microseva
//
//  Created by Naga Bhimanpati on 22/09/24.
//

import SwiftUI
import iPhoneNumberField

struct SignUpView: View {
    var body: some View {
        @State var text = ""

        // MARK: - LoginView

            ZStack {
              CustomBackgroundView()

              VStack {
                // MARK: - HEADER

                VStack(alignment: .leading) {
                    Text("MS_Enter_Mobile_Number".localized)
                    .fontWeight(.black)
                    .font(.system(size: 52))
                    .foregroundStyle(
                      LinearGradient(
                        colors: [
                          .customGrayLight,
                          .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                    )

                    Text("MS_OTP_Wait_Message".localized)
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)

                // MARK: - MAIN CONTENT

                ZStack {
                  //CustomCircleView()

                  Image("image-5")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: 1)
                }

                  iPhoneNumberField(text: $text)
                              .flagHidden(false)
                              .flagSelectable(true)
                              .font(UIFont(size: 30, weight: .bold, design: .rounded))
                              .padding()

                // MARK: - FOOTER

                Button {
                  // ACTION:
                } label: {
                  Text("MS_SignUp".localized)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                      LinearGradient(
                        colors: [
                          .customGreenLight,
                          .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                      )
                    )
                    .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
              } //: ZSTACK
            }
        } //: SignUpView
}

#Preview {
    SignUpView()
}
