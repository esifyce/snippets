//
//  NetworkReachabilityManager.swift
//
//
//  Created by Krasivo on 03.10.2022.
//

import UIKit
import Network

//MARK: - ConnectionQuality Implementation
enum ConnectionQuality {
    case satisfiedAndReachable
    case unsatisfiedPing
    case unReachable
}

//MARK: - NetworkReachabilityManager Protocol
protocol NetworkReachabilityManagerProtocol: AnyObject {
    func sessionEndedWithError() -> Bool
}

protocol NetworkReachabilityManagerDelegate: AnyObject {
    func connectionStatusChanged(_ status: ConnectionQuality)
}

//MARK: - NetworkReachabilityManager Implementation
public final class NetworkReachabilityManager: NSObject {
    //MARK: Public fields
    weak var delegate: NetworkReachabilityManagerDelegate?
    
    //MARK: Private fields
    private let queue = OperationQueue()
    private let monitor = NWPathMonitor()
    private var pinger: PingHelper!
    
    //MARK: Lifecycle
    override init() {
        super.init()
        setupPinger()
        setupPathMonitor()
    }
}

//MARK: - NetworkReachabilityManager Private Methods
extension NetworkReachabilityManager {
    private func setupPathMonitor() {
        monitor.start(queue: .global())
        monitor.pathUpdateHandler = { [weak self] path in
            let _ = self?.processConnectionStatus(path.status)
        }
    }
    
    private func setupPinger() {
        let mainHost = buildURL("https://www.google.com")
        //TODO: - подключить резервные хосты
        let reservedHost = buildURL("https://www.apple.com")
        pinger = PingHelper(host: mainHost, reservedHosts: [reservedHost], isPingSatisfied: { [weak self] isPingSatisfied in
            guard let `self` = self else { return }
            let status = self.monitor.currentPath.status
            switch status {
            case .satisfied:
                if isPingSatisfied {
                    self.delegate?.connectionStatusChanged(.satisfiedAndReachable)
                } else  {
                    self.delegate?.connectionStatusChanged(.unsatisfiedPing)
                }
                return
            default:
                break
            }
            self.delegate?.connectionStatusChanged(.unReachable)
        })
    }
    
    private func buildURL(_ string: String) -> URL {
        guard let url = URL(string: string) else {
            //возвращаем дефолтный url
            return URL(string: "https://apple.com")!
        }
        return url
    }
    
    private func checkInternetConnection() -> Bool {
        let status = monitor.currentPath.status
        if processConnectionStatus(status) {
            return true
        } else {
            return false
        }
    }
    
    private func processConnectionStatus(_ status: NWPath.Status) -> Bool {
        switch status {
        case .satisfied:
            pinger.startPinging()
            return false
        case .requiresConnection, .unsatisfied:
            delegate?.connectionStatusChanged(.unReachable)
            return true
        default:
            break
        }
        return false
    }
}

//MARK: - NetworkReachabilityManagerProtocol Implementation
extension NetworkReachabilityManager: NetworkReachabilityManagerProtocol {
    func sessionEndedWithError() -> Bool {
        checkInternetConnection()
    }
}
