//
//  SyncJobStatus.swift
//  Emby.ApiClient
//

import Foundation

public enum SyncJobStatus: Int, Codable {
    case Queued
    case Converting
    case ReadyToTransfer
    case Transferring
    case Completed
    case CompletedWithError
    case Failed
    case Cancelled
}
