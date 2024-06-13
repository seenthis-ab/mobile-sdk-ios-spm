// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppNexusSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AppNexusSDK",
            targets: [
                "OMSDK_Microsoft",
                "AppNexusSDKTarget"
            ]
        ),
        .library(
            name: "GoogleMediationAdapter",
            targets: [
               "ANGoogleMobileAdsTarget"
            ]
        ),
    ],
     dependencies: [
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .exact("11.2.0"))
    ],
    targets: [
        .binaryTarget(
            name: "OMSDK_Microsoft",
            url:
                "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-alpha.8/OMSDK_Microsoft.zip",
            checksum: "84bbf33d31dbfb5acdfb0b8326244ec0f7801cc7322c22a4519d8d98b08bab7b"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-alpha.8/AppNexusSDKDynamic.zip",
            checksum: "a1dfba4c70826f5a2696a2ad120ecfa44bb461984aab50335a35fd827726beec"
        ),
      .target(
         name: "ANGoogleMobileAdsTarget",
      dependencies: [
        .target(name: "ANGoogleMobileAds"),
        .target(name: "AppNexusSDKTarget"),
        .product(name: "GoogleMobileAds", package: "GoogleMobileAds")
      ],
      path: "ANGoogleMobileAdsTarget"
    ),
    .binaryTarget(
      name: "ANGoogleMobileAds",
      url: "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-alpha.8/ANGoogleAdapter.zip",
     checksum: "9fd126e1ebd8d466a043ae5664c4c4c2b42d6803c8c59a09e3cb91f099d3a79b"
    )
    ]
)