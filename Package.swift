// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "KituraApiToken",
    products: [
        .library(
            name: "KituraApiToken",
            targets: ["KituraApiToken"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/IBM-Swift/Kitura.git", from: "1.7.9")
    ],
    targets: [
        .target(
            name: "KituraApiToken",
            dependencies: ["Kitura"],
            // need to define path for now
            // https://bugs.swift.org/browse/SR-5799?page=com.atlassian.jira.plugin.system.issuetabpanels%3Achangehistory-tabpanel
            path: "Sources")
    ]
)
