// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ffmpeg-kit-macos-full",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "ffmpeg-kit-macos-full",
            targets: ["ffmpeg-kit-macos-full"]
        )
    ],
    targets: [

        // 主聚合 target
        .target(
            name: "ffmpeg-kit-macos-full",
            dependencies: [
                "ffmpegkit",
                "libavcodec",
                "libavdevice",
                "libavfilter",
                "libavformat",
                "libavutil",
                "libswresample",
                "libswscale"
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("bz2"),
                .linkedLibrary("c++"),
                .linkedLibrary("iconv"),

                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("OpenCL"),
                .linkedFramework("OpenGL"),
                .linkedFramework("Security"),
                .linkedFramework("VideoToolbox")
            ]
        ),

        // 每个 xcframework 都是一个 binaryTarget

        .binaryTarget(
            name: "ffmpegkit",
            path: "Frameworks/ffmpegkit.xcframework"
        ),
        .binaryTarget(
            name: "libavcodec",
            path: "Frameworks/libavcodec.xcframework"
        ),
        .binaryTarget(
            name: "libavdevice",
            path: "Frameworks/libavdevice.xcframework"
        ),
        .binaryTarget(
            name: "libavfilter",
            path: "Frameworks/libavfilter.xcframework"
        ),
        .binaryTarget(
            name: "libavformat",
            path: "Frameworks/libavformat.xcframework"
        ),
        .binaryTarget(
            name: "libavutil",
            path: "Frameworks/libavutil.xcframework"
        ),
        .binaryTarget(
            name: "libswresample",
            path: "Frameworks/libswresample.xcframework"
        ),
        .binaryTarget(
            name: "libswscale",
            path: "Frameworks/libswscale.xcframework"
        )
    ]
)