
import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTY

  @AppStorage(Storage.onboardingFlag) var isOnboardingViewActive: Bool = true
    @State var pushloginScreen: Bool = false

  // MARK: - BODY

    var body: some View {
        // MARK: - OnboardingView

        ZStack {
          CustomBackgroundView()

          VStack {
            // MARK: - HEADER

            VStack(alignment: .leading) {
                Text("MS_Welcome".localized)
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

                Text("MS_LoginOrSignUp".localized)
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundColor(.customGrayMedium)
            } //: HEADER
            .padding(.horizontal, 30)

            // MARK: - MAIN CONTENT

            ZStack {
              //CustomCircleView()

              Image("image-1")
                .resizable()
                .scaledToFit()
                .animation(.default, value: 1)
            }

            // MARK: - FOOTER

            Button {
              // ACTION:
                pushloginScreen = true
            } label: {
              Text("MS_Login".localized)
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


//              NavigationLink(destination: LoginView(), isActive: $pushloginScreen, label: {
//                  EmptyView()
//              })

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
        } //: OnboardingView
      }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
