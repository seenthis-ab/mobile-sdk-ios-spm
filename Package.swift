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
                "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-beta.3/dynamic/OMSDK_Microsoft.zip",
            checksum: "aa8b19113ffaa1548bc40f9c8ea26037e6b09e28629deff086f50ce4ee79bd6c"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-beta.3/dynamic/AppNexusSDKDynamic.zip",
            checksum: "bd8ca17902a91c5e3dc8791986da8f21bfbb41c03989f5f0620fd404bee88caa"
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
      url: "https://adsdkdevstand.azureedge.net/dev/mobile/mtest/adoreleasetest/9.0.0-beta.3/static/ANGoogleAdapter.xcframework.zip",
     checksum: "f7829d54423da0d70f8f1e13767954587d27aaef2c6c810752ba83bb0c0fa56e"
    )
    ]
)
