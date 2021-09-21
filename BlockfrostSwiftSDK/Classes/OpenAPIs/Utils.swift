//
//  File.swift
//  File
//
//  Created by Dusan Klinec on 14.09.2021.
//

import Foundation
import Alamofire
//import PromiseKit
//import AwaitKit
//import SwiftCoroutine

final class Atomic<A> {
    private let queue = DispatchQueue(label: "Atomic serial queue")
    private var _value: A
    init(_ value: A) {
        self._value = value
    }

    var value: A {
        get {
            return queue.sync { self._value }
        }
    }

    @discardableResult
    func mutate(_ transform: (inout A) -> ()) -> A {
        var res: A = _value
        queue.sync {
            transform(&self._value)
            res = _value
        }
        return res
    }

    func set(_ a: A) {
        queue.sync {
            self._value = a
        }
    }

    func get() -> A {
        return value
    }
}

public enum ConcurrentQueueError: Error {
    case empty
}

class ConcurrentQueue<A> {
    private let queue = DispatchQueue(label: "ConcurrentQueueQueue")
    private var _queue: [A] = []

    func add(_ elem: A){
        queue.sync {
            self._queue.append(elem)
        }
    }

    func pop() throws -> A  {
        return try queue.sync {
            if self._queue.isEmpty {
                throw ConcurrentQueueError.empty
            } else {
                return self._queue.removeFirst()
            }
        }
    }

    func poll() -> A?  {
        return queue.sync {
            if self._queue.isEmpty {
                return nil
            } else {
                return self._queue.removeFirst()
            }
        }
    }

    func isEmpty() -> Bool {
        return queue.sync {
            return self._queue.isEmpty
        }
    }

    func clear() {
        return queue.sync {
            self._queue.removeAll()
        }
    }
    
    @discardableResult
    func mutate(_ transform: (inout [A]) -> ()) -> [A] {
        var res: [A] = _queue
        queue.sync {
            transform(&self._queue)
            res = _queue
        }
        return res
    }
}

//extension OperationQueue: CoroutineScheduler {
//    public func scheduleTask(_ task: @escaping () -> Void) {
//        addOperation(task)
//    }
//}
//
//func resolveWith<A>(_ res: A, scope: CoScope? = nil) -> CoPromise<A> {
//    let p = CoPromise<A>()
//    if let sc = scope {
//        p.added(to: sc)
//    }
//    p.complete(with: Swift.Result<A, Error>.success(res))
//    return p
//}
//
//func failWith<A, E: Error>(_ err: E, scope: CoScope? = nil) -> CoPromise<A> {
//    let p = CoPromise<A>()
//    if let sc = scope {
//        p.added(to: sc)
//    }
//    p.complete(with: Swift.Result<A, E>.failure(err))
//    return p
//}

func runNoExcLog(_ msg: String? = nil, task: @escaping () throws -> ()) {
    do {
        try task()
    } catch let err {
        //DDLogError("\(msg ?? "Exception"): \(err)")
    }
}

func synchronized(_ lockObj: Any, closure: ()->()){
    objc_sync_enter(lockObj)
    closure()
    objc_sync_exit(lockObj)
}

func locked<T>(_ lock: NSLocking, closure: @escaping () -> T) -> T{
    lock.lock()
    defer { lock.unlock() }
    return closure()
}

func lockedThrow<T>(_ lock: NSLocking, closure: @escaping () throws -> T) throws -> T {
    lock.lock()
    defer { lock.unlock() }
    return try closure()
}

//func str2byte(_ str: String) -> [UInt8] {
//    return str.replacingOccurrences(of: " ", with: "").hexToBytes
//}

//extension PromiseKit.Result where Failure == Error {
//    public func throwOnError() throws -> Void {
//        if case .failure(let e) = self {
//            throw e
//        }
//    }
//}


