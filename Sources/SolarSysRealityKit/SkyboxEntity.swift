//
//  SkyboxEntity.swift
//  SolarSysRealityKit
//
//  Created by Ace on 21/9/2025.
//

import Foundation
import RealityKit

public class SkyboxEntity: Entity {
    
    public enum SkyboxType: String {
        case starfield = "starfield"
        case nebula = "nebula"
        case bluesky = "bluesky"
        case puresky = "puresky"
        case melbourne = "Melbourne"
        case hapiLab = "HAPI-lab"
    }
    
    required init() {
        fatalError("Unsupported initializer")
    }
    
    public required init(_ type: SkyboxType = .starfield) async {
        super.init()
        
        if let hapiLabTexture = try? await TextureResource(named: type.rawValue) {
            let mesh = MeshResource.generateSphere(radius: 10)
            let material = UnlitMaterial(texture: hapiLabTexture)
            let hapiSphere = ModelEntity(mesh: mesh, materials: [material])
            self.addChild(hapiSphere)
            hapiSphere.transform.scale = SIMD3(-1, 1, 1)
        }
    }
    
}
