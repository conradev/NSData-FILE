# NSData+FILE

NSData+FILE contains a single function, `CKOpenData` which allows an `NSData` object to be manipulated as a `FILE` stream.

## Example Usage

``` objc
NSMutableData *mutableData = [NSMutableData data];
FILE *stream = CKOpenData(mutableData);
fputs("Hello World!", stream);
fclose(stream);
NSString *string = [[NSString alloc] initWithData:mutableData encoding:NSUTF8StringEncoding];
NSLog(@"%@", string);
```

```
Hello World!
```

## License

NSData+FILE is available under the MIT license. See the LICENSE file for more info.
