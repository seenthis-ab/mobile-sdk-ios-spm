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
            checksum: "b8d46f019ede80963b2e92e2bebfa15547287e260c4a3696999d185d6cc84098"
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
     checksum: "43ce61bf1a810762fdd07c0b547bae3a7a53aa2ddc1bdfca41cb59826d501247"
    )
    ]
)