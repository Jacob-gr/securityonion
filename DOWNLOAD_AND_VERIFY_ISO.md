### 2.4.60-20240320 ISO image released on 2024/03/20


### Download and Verify

2.4.60-20240320 ISO image:  
https://download.securityonion.net/file/securityonion/securityonion-2.4.60-20240320.iso
 
MD5: 178DD42D06B2F32F3870E0C27219821E  
SHA1: 73EDCD50817A7F6003FE405CF1808A30D034F89D  
SHA256: DD334B8D7088A7B78160C253B680D645E25984BA5CCAB5CC5C327CA72137FC06  

Signature for ISO image:  
https://github.com/Security-Onion-Solutions/securityonion/raw/2.4/main/sigs/securityonion-2.4.60-20240320.iso.sig

Signing key:  
https://raw.githubusercontent.com/Security-Onion-Solutions/securityonion/2.4/main/KEYS  

For example, here are the steps you can use on most Linux distributions to download and verify our Security Onion ISO image.

Download and import the signing key:  
```
wget https://raw.githubusercontent.com/Security-Onion-Solutions/securityonion/2.4/main/KEYS -O - | gpg --import -  
```

Download the signature file for the ISO:  
```
wget https://github.com/Security-Onion-Solutions/securityonion/raw/2.4/main/sigs/securityonion-2.4.60-20240320.iso.sig
```

Download the ISO image:  
```
wget https://download.securityonion.net/file/securityonion/securityonion-2.4.60-20240320.iso
```

Verify the downloaded ISO image using the signature file:  
```
gpg --verify securityonion-2.4.60-20240320.iso.sig securityonion-2.4.60-20240320.iso
```

The output should show "Good signature" and the Primary key fingerprint should match what's shown below:
```
gpg: Signature made Tue 19 Mar 2024 03:17:58 PM EDT using RSA key ID FE507013
gpg: Good signature from "Security Onion Solutions, LLC <info@securityonionsolutions.com>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: C804 A93D 36BE 0C73 3EA1  9644 7C10 60B7 FE50 7013
```

Once you've verified the ISO image, you're ready to proceed to our Installation guide:  
https://docs.securityonion.net/en/2.4/installation.html
