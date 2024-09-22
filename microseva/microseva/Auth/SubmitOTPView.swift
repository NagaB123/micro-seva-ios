//
//  SubmitOTPView.swift
//  microseva
//
//  Created by Naga Bhimanpati on 22/09/24.
//

import SwiftUI

struct SubmitOTPView: View {

    @State private var otp: String = ""
    @FocusState private var isOTPFieldFocused: Bool
    private let numberOfFieldsInOTP = 6

    var body: some View {

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

              Image("image-3")
                .resizable()
                .scaledToFit()
                .animation(.default, value: 1)

              Text("VERIFICATION CODE")
                  .foregroundColor(Color.gray)
                  .font(.system(size: 12))

              OTPFieldView(numberOfFields: numberOfFieldsInOTP, otp: $otp)
                  .onChange(of: otp) { newOtp in
                      if newOtp.count == numberOfFieldsInOTP {
                          // Verify OTP
                      }
                  }
                  .focused($isOTPFieldFocused)

            // MARK: - FOOTER

            Button {
              // ACTION:
            } label: {
              Text("MS_SubmitOTP".localized)
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
            .padding(12)
          } //: ZSTACK
          .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                  isOTPFieldFocused = true
              }
          }
        }
    }
}

#Preview {
    SubmitOTPView()
}
