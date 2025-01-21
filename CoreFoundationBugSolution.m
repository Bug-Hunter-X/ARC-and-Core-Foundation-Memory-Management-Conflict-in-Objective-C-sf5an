To avoid these issues, ensure consistent usage of `CFRetain` and `CFRelease` and employ proper bridging mechanisms between Core Foundation and Objective-C objects using functions like `__bridge`, `__bridge_retained`, and `__bridge_transfer`.  For example:

```objectivec
CFStringRef cfString = CFStringCreateWithCString(kCFAllocatorDefault, "Hello, world!", kCFStringEncodingUTF8);
NSString *nsString = (__bridge_transfer NSString *)cfString; // Correct transfer ownership
// ... Use nsString ...
// No need to manually release cfString - ARC handles it
```

This pattern automatically handles memory management, preventing issues like double release.  Alternatively, you could use `CFBridgingRelease` to manage the transfer of ownership, where necessary.  The key is to maintain a consistent approach in how you handle Core Foundation objects within your ARC-managed code to prevent unexpected memory issues.