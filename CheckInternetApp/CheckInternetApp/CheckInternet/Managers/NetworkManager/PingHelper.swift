//
//  PingHelper.swift
//  CheckInternetApp
//
//  Created by Krasivo on 08.05.2023.
//

import Foundation

protocol PingHelperDelegate: AnyObject {
    func pingHelper(isPingSatisfied: Bool)
}

final class PingHelper: NSObject {
    private var host: URL
    private var reservedHosts: [URL] = []
    private var isPingSatisfied: (Bool) -> ()
    //желательное время для пинга сервера
    var desiredPingTime: TimeInterval = 0.005
    //максимально позволительное время пинга
    var acceptablePingTime: TimeInterval = 2.0
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForResource = acceptablePingTime
        let session = URLSession(configuration: configuration,
                                 delegate: self,
                                 delegateQueue: nil)
        return session
    }()
    
    init(host: URL, reservedHosts: [URL] = [], isPingSatisfied: @escaping (Bool) -> ()) {
        self.host = host
        self.reservedHosts = reservedHosts
        self.isPingSatisfied = isPingSatisfied
        super.init()
    }
    
    func startPinging() {
        pingServer(serverURL: host)
    }
}

//MARK: - PingHelper Private Function
extension PingHelper {
    private func pingServer(serverURL: URL) {
        let request = makeRequest(url: serverURL)
        session.dataTask(with: request).resume()
    }
    
    private func makeRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return request
    }
    
    private func processRequest(task: URLSessionTask, metrics: URLSessionTaskMetrics) {
        guard task.error == nil else {
            print("Error:", task.error ?? "")
            isPingSatisfied(false)
            return
        }
        guard let ping = calculatePing(fromMetrics: metrics) else { return }
        print("--- For \(task.originalRequest?.url?.description ?? "HZ Request") ---")
        print("ping: \(ping)")
        
        guard (task.response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Server down")
            isPingSatisfied(false)
            return
        }
        print("Server Up")
        isPingSatisfied(ping < desiredPingTime)
    }
    
    private func calculatePing(fromMetrics metrics: URLSessionTaskMetrics) -> TimeInterval? {
        guard let metric = metrics.transactionMetrics.last,
              let start = metric.responseStartDate?.timeIntervalSince1970,
              let end = metric.responseEndDate?.timeIntervalSince1970 else { return nil }
        return end - start
    }
}

extension PingHelper: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        processRequest(task: task, metrics: metrics)
    }
}

