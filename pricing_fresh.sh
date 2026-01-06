#!/bin/bash

echo "🏪 Running ONLY Pricing and Availability Update..."

# Set the fresh session token (Generated: 2026-01-06 14:00)
export FASTLANE_SESSION='---
- !ruby/object:HTTP::Cookie
  name: dslang
  value: US-EN
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 
  created_at: 2026-01-06 14:00:44.910393000 +05:30
  accessed_at: &1 2026-01-06 14:00:44.912573000 +05:30
- !ruby/object:HTTP::Cookie
  name: site
  value: USA
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 
  created_at: 2026-01-06 14:00:44.910819000 +05:30
  accessed_at: *1
- !ruby/object:HTTP::Cookie
  name: myacinfo
  value: DAWTKNV323952cf8084a204fb20ab2508441a07d02d35f7d5e2c6c8b2a8ef1b8c0977e08e4b718de04aeaaa5c5b727699ca2e46fe6f957c90a68bc95ad36a9252f996ef13ec0a8b419dcf5c2895b0dd7db0709df2ac2956ba5ea00485f43e53970c022bb36eaf5174712d629773e0236688ac17824bfb8161913b4060a7222d4c4a59160b225134babc3fae9dfd8402b038af8b33d1f4ae5013ed93f31d4d5d2243f78ee8bb42bdcb30955d7874884c777f1bbd1a341868c8455d8bcccca22dca7c2289c43231f276f1639cb952237a5956f7a97a0af2326f4ba66401ea6046e3117b9fb34357e208eb422bffb9637a31ce803cdc0f29a1d9b6a141577c86c6194dd3bea728755b07b337a7d58f3cafa55cd0808ec6a9e87a6d4a7e884eb2e46399f3d7a415b09c6618bcec19876c45a4982f8aab58a989bfbd2a45a00eb1c41628ab2e77d365554cff0b01532983924efb6b0be53ad1f505e67d1cd9a588cccfdf00c60f2a8dcbbb1585d8b4982958b3647b7b47935b2eaadb0941b14f345e7be8409cb3ff4c782b34ac9927b26ade3eb87ddc459a3739834d7b5dcf2e9c5aab89f3a8006c28fb6d3d19b8aad8e32dd515f16c0fd16a3e4bbb317709c31f06d44675a4a0c2243bf48177123818fd2390a13f2ac6049bf2baed4bcf96c8dfa0622e22468eb2bab89da163b7b28c8c00729f9e58f9fafdc61a94b618431d774c427f6aa3b547584733e593b7034174d9bbdb0d57b5266585a47V3
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 
  created_at: 2026-01-06 14:00:44.911119000 +05:30
  accessed_at: *1
- !ruby/object:HTTP::Cookie
  name: itctx
  value: eyJjcCI6ImIwYTcwMGJlLWY4ZmEtNDgxYy1iYjA3LTk5OTJhMmUyMDUyZCIsImRzIjoyMjU3MzM0ODU3MiwiZXgiOiIyMDI2LTEtNiAxNjozMDo0NSJ9|s54j5av06s2qgk31vmnsduckvf|bc17m1Z_9WC_hQFggU42yoITrWo
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 
  created_at: &2 2026-01-06 14:00:45.816395000 +05:30
  accessed_at: *2
- !ruby/object:HTTP::Cookie
  name: itcdq
  value: "0"
  domain: apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: false
  expires: 
  max_age: 
  created_at: 2025-10-10 11:30:13.953707000 +05:30
  accessed_at: *1
- !ruby/object:HTTP::Cookie
  name: aasp
  value: 5704F8F02EB63445DD7691DC7E43B06746FC08F2AB1DC9706B83B4E1558668F7DB655DA42E4069991E5F5323AEBB2A1974C94EEC91645AA8EDC1AA0D89E30581BCE13E3FC7487CD72002927C91177D8243591B3505335FCEB002B39373A25493A24EC888406E26FC9801EC8B5BB77C66B89CB54DC1B791D9
  domain: idmsa.apple.com
  for_domain: true
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 
  created_at: 2026-01-06 14:00:43.518510000 +05:30
  accessed_at: &3 2026-01-06 14:00:43.527778000 +05:30
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
  created_at: 2025-12-31 16:33:55.743577000 +05:30
  accessed_at: *3
- !ruby/object:HTTP::Cookie
  name: dqsid
  value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Njc2ODgyNDUsImp0aSI6Ilo2VzhsVXBWeEJCeGlSR3VJR1hEVUEifQ.aRfPP5GZ-1JY53wcFS3Ri_3XdLllQ5D2ExfhBw0z06M
  domain: appstoreconnect.apple.com
  for_domain: false
  path: "/"
  secure: true
  httponly: true
  expires: 
  max_age: 1800
  created_at: &4 2026-01-06 14:00:45.816041000 +05:30
  accessed_at: *4'

export FASTLANE_PASSWORD="Sanket_4392"
export FASTLANE_SKIP_2FA_UPGRADE=1
export FASTLANE_HIDE_CHANGELOG=1
export APP_STORE_CONNECT_API_KEY_KEY_ID="762ZATSHW9"
export APP_STORE_CONNECT_API_KEY_ISSUER_ID="69a6de92-0f0b-47fc-a463-0b4e4b9f8a2a"
export APP_STORE_CONNECT_API_KEY_KEY="$(cat /Users/manzz/Mobibox/Lambda/ios\ fastlane/AuthKey_762ZATSHW9.p8)"

cd "/Users/manzz/Mobibox/Lambda/ios fastlane/ios-builder"

echo "💰 Running pricing update with fresh session token..."
fastlane configure_pricing_and_availability bundle_id:"com.san.mainAp"
