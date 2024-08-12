//
//  ColombiaEarthquakeApp.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 19/07/24.
//

import SwiftUI
import UserNotifications

@main
struct ColombiaEarthquakeApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
            appDelegate.quakesProvider = quakesProvider
        }
    
    
    var body: some Scene {
        WindowGroup {
            VStack{
                IntroductionView()
            }
            .environmentObject(quakesProvider)
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var quakesProvider: QuakesProvider?
    let lastEarthQuakeByPlace = UserDefaults.standard.string(forKey: "lastEarthQuakeByPlaceId")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Accede al valor almacenado en UserDefaults
        let isBackgroundFetchEnabled = UserDefaults.standard.bool(forKey: "isBackgroundFetchEnabled")
        
        
        print("last earthquake saved \(String(describing: lastEarthQuakeByPlace))")
        
        guard isBackgroundFetchEnabled else {
            completionHandler(.noData)
            return
        }
        
        fetchNewData { success in
            if success {
                self.sendNotification(title: "Fue exitoso \(String(describing: self.quakesProvider?.quakesByPlaces.count))", body: "last id saved \(String(describing: self.lastEarthQuakeByPlace))")
                completionHandler(.newData)
            } else {
                self.sendNotification(title: "No fue exitoso \(String(describing: self.quakesProvider?.quakesByPlaces.count))", body: "last id saved \(String(describing: self.lastEarthQuakeByPlace))")
                completionHandler(.failed)
            }
        }
    }

    private func fetchNewData(completion: @escaping (Bool) -> Void) {
            var success = true
            guard let lastEarthQuakeByPlace = self.lastEarthQuakeByPlace,
                  let lastEarthQuakeID = Int(lastEarthQuakeByPlace) else {
                print("Error: No se pudo convertir lastEarthQuakeByPlace a Int")
                return
            }
            Task{
                do{
                    try await self.quakesProvider?.fetchQuakesByPlace(for: lastEarthQuakeID)
                }
                catch{
                    success = false
                }
                completion(success)
            }
             // Aquí decides si fue exitoso o no
            
            
        
    }
    
    private func sendNotification(title: String, body: String) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default
    
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Failed to add notification: \(error.localizedDescription)")
                }
            }
        }
}
