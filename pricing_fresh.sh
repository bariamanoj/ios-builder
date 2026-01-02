#!/bin/bash

echo "🏪 Running ONLY Pricing and Availability Update..."

# Set the fresh session token
export FASTLANE_SESSION='---
- !ruby/object:HTTP::Cookie
  name: myacinfo
  value: DAWTKNV323952cf8084a204fb20ab2508441a07d02d39bedd83c0348216a66da3625179f9b3d7556a954458f57dea9678ca206881fb44d8d717b2ee861f669f6d3c5debbad2054226ea9f9c4d2f72451a13ad644dd8d0defd8dd288f09de23b9c5a1c74c2f1df0ffe19f3f1675d9b96a290ce31f92c86faab37e6e9bcd919823ca87494648b1f8b2f0b0541981d910f79f43f11d81ac4713b1b16d13e151318eab12bb373992249ff8edd428b1e42a7887aa85f0c27bcd500582c0eddacc5adfe7e6a0947a2de239afe13f206ca3994f5498a275abb85f1898c1d95b484191bf724c6b495d2954d52412aae04dbd484d6a60f2f3a22c1d58189b295593544c9956eebd72d9c7555b622e4482a62aabc7c8e572c0e3602a96409330b27678e293b12c5f5cbfa7e79cc8056260cb72d3bfedca7722b8e2d1e388dd979727490975e39e72e2c6a60337ad0ebfe79660a86c708a7909617e4893d002cf13625ff2bfc046f03488f2b8005c553189598e8f938eecfa3a7527d0fc324cdcaa9042817e8fa65e0feb0d96f773fde2a8e533c33f862855907cd0b272e525c180247720c8f33785da4fd64e708b385af7278f0ef49d936903df504a68fdfbd3fb02c09502e5e1089df79c305535aba2dbeea06875044ad5f1f2c698c1bcb1284a97b3a17f0390327a5d18feeec741c9f202a653d7d1774a0eb626a32a604924b6ccfecd65546754390ca2159d102004b38da1f33661025099f3ac0532f7c97603663268603f555ec94d1b505b04fdedd6fd3b4f644b18ed660cb5c23cfb3f86f1b59ad2013d2541923385f5468b0b164c5862469aa4786be723d2f905c1a6cb78f74b23c5574c19eebe55ffc46b8dfd21adc2cf564af1ee39b5b38cc44fc8db53d2cb7f3ab83cb66fafb8585a47V3
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires:
  max_age:
  created_at: 2025-12-31 16:33:55.743824000 +05:30
  accessed_at: 2025-12-31 17:28:11.318639000 +05:30
- !ruby/object:HTTP::Cookie
  name: DES521e216212c21f11a57fea7444394ae78
  value: HSARMTKNSRVXWFlapWdIKltdYDCG0xxZGWYaYqyoFaL8OnDoCCe/ebc90ntQsZf8yy+zA5NvMvc8JOBeSUkZZOSnxvZvLCJtFy04TnOL4ZQ1xapiq+SvcbclMRe7hWNtjTKGLktsdV5C3/L/5B66xLik55YVBgfeVFh5dGksijfMSih22dcSKytj9icE9iANSRVX
  domain: idmsa.apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires:
  max_age: 2592000
  created_at: &1 2025-12-31 16:33:55.743577000 +05:30
  accessed_at: *1
- !ruby/object:HTTP::Cookie
  name: dqsid
  value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjcxODIyOTEsImp0aSI6ImhLZHdyZHlzSk9BbVFDX1RVN3o0YncifQ.4EcmK1u_D0ziqCoC8vbR8LhVXidvV00njSpBKMRpKK8
  domain: appstoreconnect.apple.com
  for_domain: false
  path: "/"
  secure: true
  httponly: true
  expires:
  max_age: 1800
  created_at: &2 2025-12-31 17:28:11.963978000 +05:30
  accessed_at: *2'

export FASTLANE_PASSWORD="Sanket_4392"
export FASTLANE_SKIP_2FA_UPGRADE=1
export FASTLANE_HIDE_CHANGELOG=1

cd "/Users/manzz/Mobibox/Lambda/ios fastlane/ios-builder"

echo "💰 Running pricing update with fresh session token..."
fastlane update_pricing_and_availability
