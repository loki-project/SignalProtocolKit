//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import <SessionHKDFKit/HKDFKit.h>
#import <XCTest/XCTest.h>

@interface HKDFTest : XCTestCase

@end

@implementation HKDFTest

- (void)testVectorV3{

    Byte ikm [] = {0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
        0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
        0x0b, 0x0b};

    Byte salt [] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
        0x0a, 0x0b, 0x0c};

    Byte info [] = {(Byte) 0xf0, (Byte) 0xf1, (Byte) 0xf2, (Byte) 0xf3, (Byte) 0xf4,
        (Byte) 0xf5, (Byte) 0xf6, (Byte) 0xf7, (Byte) 0xf8, (Byte) 0xf9};

    Byte okm []= {(Byte) 0x3c, (Byte) 0xb2, (Byte) 0x5f, (Byte) 0x25, (Byte) 0xfa,
        (Byte) 0xac, (Byte) 0xd5, (Byte) 0x7a, (Byte) 0x90, (Byte) 0x43,
        (Byte) 0x4f, (Byte) 0x64, (Byte) 0xd0, (Byte) 0x36, (Byte) 0x2f,
        (Byte) 0x2a, (Byte) 0x2d, (Byte) 0x2d, (Byte) 0x0a, (Byte) 0x90,
        (Byte) 0xcf, (Byte) 0x1a, (Byte) 0x5a, (Byte) 0x4c, (Byte) 0x5d,
        (Byte) 0xb0, (Byte) 0x2d, (Byte) 0x56, (Byte) 0xec, (Byte) 0xc4,
        (Byte) 0xc5, (Byte) 0xbf, (Byte) 0x34, (Byte) 0x00, (Byte) 0x72,
        (Byte) 0x08, (Byte) 0xd5, (Byte) 0xb8, (Byte) 0x87, (Byte) 0x18,
        (Byte) 0x58, (Byte) 0x65};

    NSData *ikmData     = [NSData dataWithBytes:ikm   length:22];
    NSData *saltData    = [NSData dataWithBytes:salt  length:13];
    NSData *infoData    = [NSData dataWithBytes:info length:10];


    NSData *okmData     = [NSData dataWithBytes:okm length:42];

    NSData *actualOutput = [HKDFKit deriveKey:ikmData info:infoData salt:saltData outputSize:42];

    XCTAssert([okmData isEqualToData:actualOutput], @"HKDF output matches test vector");
}

- (void)testVectorLongV3{

    Byte ikm []  = {(Byte) 0x00, (Byte) 0x01, (Byte) 0x02, (Byte) 0x03, (Byte) 0x04,
        (Byte) 0x05, (Byte) 0x06, (Byte) 0x07, (Byte) 0x08, (Byte) 0x09,
        (Byte) 0x0a, (Byte) 0x0b, (Byte) 0x0c, (Byte) 0x0d, (Byte) 0x0e,
        (Byte) 0x0f, (Byte) 0x10, (Byte) 0x11, (Byte) 0x12, (Byte) 0x13,
        (Byte) 0x14, (Byte) 0x15, (Byte) 0x16, (Byte) 0x17, (Byte) 0x18,
        (Byte) 0x19, (Byte) 0x1a, (Byte) 0x1b, (Byte) 0x1c, (Byte) 0x1d,
        (Byte) 0x1e, (Byte) 0x1f, (Byte) 0x20, (Byte) 0x21, (Byte) 0x22,
        (Byte) 0x23, (Byte) 0x24, (Byte) 0x25, (Byte) 0x26, (Byte) 0x27,
        (Byte) 0x28, (Byte) 0x29, (Byte) 0x2a, (Byte) 0x2b, (Byte) 0x2c,
        (Byte) 0x2d, (Byte) 0x2e, (Byte) 0x2f, (Byte) 0x30, (Byte) 0x31,
        (Byte) 0x32, (Byte) 0x33, (Byte) 0x34, (Byte) 0x35, (Byte) 0x36,
        (Byte) 0x37, (Byte) 0x38, (Byte) 0x39, (Byte) 0x3a, (Byte) 0x3b,
        (Byte) 0x3c, (Byte) 0x3d, (Byte) 0x3e, (Byte) 0x3f, (Byte) 0x40,
        (Byte) 0x41, (Byte) 0x42, (Byte) 0x43, (Byte) 0x44, (Byte) 0x45,
        (Byte) 0x46, (Byte) 0x47, (Byte) 0x48, (Byte) 0x49, (Byte) 0x4a,
        (Byte) 0x4b, (Byte) 0x4c, (Byte) 0x4d, (Byte) 0x4e, (Byte) 0x4f};

    Byte salt [] = {(Byte) 0x60, (Byte) 0x61, (Byte) 0x62, (Byte) 0x63, (Byte) 0x64,
        (Byte) 0x65, (Byte) 0x66, (Byte) 0x67, (Byte) 0x68, (Byte) 0x69,
        (Byte) 0x6a, (Byte) 0x6b, (Byte) 0x6c, (Byte) 0x6d, (Byte) 0x6e,
        (Byte) 0x6f, (Byte) 0x70, (Byte) 0x71, (Byte) 0x72, (Byte) 0x73,
        (Byte) 0x74, (Byte) 0x75, (Byte) 0x76, (Byte) 0x77, (Byte) 0x78,
        (Byte) 0x79, (Byte) 0x7a, (Byte) 0x7b, (Byte) 0x7c, (Byte) 0x7d,
        (Byte) 0x7e, (Byte) 0x7f, (Byte) 0x80, (Byte) 0x81, (Byte) 0x82,
        (Byte) 0x83, (Byte) 0x84, (Byte) 0x85, (Byte) 0x86, (Byte) 0x87,
        (Byte) 0x88, (Byte) 0x89, (Byte) 0x8a, (Byte) 0x8b, (Byte) 0x8c,
        (Byte) 0x8d, (Byte) 0x8e, (Byte) 0x8f, (Byte) 0x90, (Byte) 0x91,
        (Byte) 0x92, (Byte) 0x93, (Byte) 0x94, (Byte) 0x95, (Byte) 0x96,
        (Byte) 0x97, (Byte) 0x98, (Byte) 0x99, (Byte) 0x9a, (Byte) 0x9b,
        (Byte) 0x9c, (Byte) 0x9d, (Byte) 0x9e, (Byte) 0x9f, (Byte) 0xa0,
        (Byte) 0xa1, (Byte) 0xa2, (Byte) 0xa3, (Byte) 0xa4, (Byte) 0xa5,
        (Byte) 0xa6, (Byte) 0xa7, (Byte) 0xa8, (Byte) 0xa9, (Byte) 0xaa,
        (Byte) 0xab, (Byte) 0xac, (Byte) 0xad, (Byte) 0xae, (Byte) 0xaf};

    Byte info [] = {(Byte) 0xb0, (Byte) 0xb1, (Byte) 0xb2, (Byte) 0xb3, (Byte) 0xb4,
        (Byte) 0xb5, (Byte) 0xb6, (Byte) 0xb7, (Byte) 0xb8, (Byte) 0xb9,
        (Byte) 0xba, (Byte) 0xbb, (Byte) 0xbc, (Byte) 0xbd, (Byte) 0xbe,
        (Byte) 0xbf, (Byte) 0xc0, (Byte) 0xc1, (Byte) 0xc2, (Byte) 0xc3,
        (Byte) 0xc4, (Byte) 0xc5, (Byte) 0xc6, (Byte) 0xc7, (Byte) 0xc8,
        (Byte) 0xc9, (Byte) 0xca, (Byte) 0xcb, (Byte) 0xcc, (Byte) 0xcd,
        (Byte) 0xce, (Byte) 0xcf, (Byte) 0xd0, (Byte) 0xd1, (Byte) 0xd2,
        (Byte) 0xd3, (Byte) 0xd4, (Byte) 0xd5, (Byte) 0xd6, (Byte) 0xd7,
        (Byte) 0xd8, (Byte) 0xd9, (Byte) 0xda, (Byte) 0xdb, (Byte) 0xdc,
        (Byte) 0xdd, (Byte) 0xde, (Byte) 0xdf, (Byte) 0xe0, (Byte) 0xe1,
        (Byte) 0xe2, (Byte) 0xe3, (Byte) 0xe4, (Byte) 0xe5, (Byte) 0xe6,
        (Byte) 0xe7, (Byte) 0xe8, (Byte) 0xe9, (Byte) 0xea, (Byte) 0xeb,
        (Byte) 0xec, (Byte) 0xed, (Byte) 0xee, (Byte) 0xef, (Byte) 0xf0,
        (Byte) 0xf1, (Byte) 0xf2, (Byte) 0xf3, (Byte) 0xf4, (Byte) 0xf5,
        (Byte) 0xf6, (Byte) 0xf7, (Byte) 0xf8, (Byte) 0xf9, (Byte) 0xfa,
        (Byte) 0xfb, (Byte) 0xfc, (Byte) 0xfd, (Byte) 0xfe, (Byte) 0xff};

    Byte okm []  = {(Byte) 0xb1, (Byte) 0x1e, (Byte) 0x39, (Byte) 0x8d, (Byte) 0xc8,
        (Byte) 0x03, (Byte) 0x27, (Byte) 0xa1, (Byte) 0xc8, (Byte) 0xe7,
        (Byte) 0xf7, (Byte) 0x8c, (Byte) 0x59, (Byte) 0x6a, (Byte) 0x49,
        (Byte) 0x34, (Byte) 0x4f, (Byte) 0x01, (Byte) 0x2e, (Byte) 0xda,
        (Byte) 0x2d, (Byte) 0x4e, (Byte) 0xfa, (Byte) 0xd8, (Byte) 0xa0,
        (Byte) 0x50, (Byte) 0xcc, (Byte) 0x4c, (Byte) 0x19, (Byte) 0xaf,
        (Byte) 0xa9, (Byte) 0x7c, (Byte) 0x59, (Byte) 0x04, (Byte) 0x5a,
        (Byte) 0x99, (Byte) 0xca, (Byte) 0xc7, (Byte) 0x82, (Byte) 0x72,
        (Byte) 0x71, (Byte) 0xcb, (Byte) 0x41, (Byte) 0xc6, (Byte) 0x5e,
        (Byte) 0x59, (Byte) 0x0e, (Byte) 0x09, (Byte) 0xda, (Byte) 0x32,
        (Byte) 0x75, (Byte) 0x60, (Byte) 0x0c, (Byte) 0x2f, (Byte) 0x09,
        (Byte) 0xb8, (Byte) 0x36, (Byte) 0x77, (Byte) 0x93, (Byte) 0xa9,
        (Byte) 0xac, (Byte) 0xa3, (Byte) 0xdb, (Byte) 0x71, (Byte) 0xcc,
        (Byte) 0x30, (Byte) 0xc5, (Byte) 0x81, (Byte) 0x79, (Byte) 0xec,
        (Byte) 0x3e, (Byte) 0x87, (Byte) 0xc1, (Byte) 0x4c, (Byte) 0x01,
        (Byte) 0xd5, (Byte) 0xc1, (Byte) 0xf3, (Byte) 0x43, (Byte) 0x4f,
        (Byte) 0x1d, (Byte) 0x87};

    NSData *ikmData  = [NSData dataWithBytes:ikm length:80];
    NSData *saltData = [NSData dataWithBytes:salt length:80];
    NSData *infoData = [NSData dataWithBytes:info length:80];

    NSData *okmData  = [NSData dataWithBytes:okm length:82];

    NSData *actualOutput = [HKDFKit deriveKey:ikmData info:infoData salt:saltData outputSize:82];

    XCTAssert([actualOutput isEqualToData:okmData], @"HKDF output matches long test vector");
}

@end
