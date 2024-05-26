//
//  HeartRateManager.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 20/05/24.
//

import HealthKit
import WatchKit

class HeartRateManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var heartRate: Double = 0.0
    @Published var attackIndicator: Double = 100.0
    @Published var charColorLayer = 0
    @Published var health: Int = 10
    @Published var zombieOffset: CGFloat = 100
    
    init() {
        requestHeartRatePermission()
    }
    
    func requestHeartRatePermission() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let typesToRead: Set = [heartRateType]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if success {
                self.startHeartRateDetection()
            }
        }
    }
    
    func startHeartRateDetection() {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        let query = HKObserverQuery(sampleType: heartRateType, predicate: nil) { (query, completionHandler, error) in
            if let error = error {
                return
            }
            
            self.fetchLatestHeartRate { heartRate in
                DispatchQueue.main.async {
                    self.heartRate = heartRate
                }
            }

            completionHandler()
        }
        
        healthStore.execute(query)
        healthStore.enableBackgroundDelivery(for: heartRateType, frequency: .immediate) { (success, error) in
        }
    }
    
    func fetchLatestHeartRate(completion: @escaping (Double) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            if let error = error {
                completion(0.0)
                return
            }
            
            if let heartRateSample = samples?.first as? HKQuantitySample {
                let heartRateUnit = HKUnit.count().unitDivided(by: .minute())
                let heartRate = heartRateSample.quantity.doubleValue(for: heartRateUnit)
                completion(heartRate)
            } else {
                completion(0.0)
            }
        }
        
        healthStore.execute(query)
    }
    
    func handleHeartRateChange(heartRate: Double) {
            self.heartRate = heartRate
            if heartRate > attackIndicator {
                WKInterfaceDevice.current().play(.success)
            } else {
                charColorLayer += 1
                health -= 1
                WKInterfaceDevice.current().play(.failure)
            }
        }
}
