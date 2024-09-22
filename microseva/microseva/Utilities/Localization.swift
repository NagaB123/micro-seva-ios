
import Foundation

extension String {
    var localized : String {
        LocalizationManager.localized(self) 
    }
}

class LocalizationManager {

    static var stringsJson: [String : Any] = [:]

    static func loadStrings() {
        if stringsJson.count == 0 {
            let inUnitTest = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
            guard let path: String = inUnitTest ? ResourceHelper.projectRootURL(projectRef: #file, fileName: "microseva/Resources/Localizable.json")?.path : Bundle.main.path(forResource: "Localizable", ofType: "json") else {
                return
            }

            let url = URL(fileURLWithPath: path)
            guard let data = try? Data.init(contentsOf: url) else {
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else {
                return
            }
            stringsJson = json
        }
    }

    static func localized(_ s: String) -> String {
        loadStrings()
        guard let entry = stringsJson[s] as? [String : String] else {
            return ""
        }
        let language = Locale.current.language.languageCode?.identifier ?? "default"
        let localized = entry[language]
        return  localized ?? ""
    }
}
