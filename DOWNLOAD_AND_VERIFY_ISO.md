### 2.4.30-20231219 ISO image released on 2023/12/19



### Download and Verify

2.4.30-20231219 ISO image:  
https://download.securityonion.net/file/securityonion/securityonion-2.4.30-20231219.iso
 
MD5: 69DDC559C0ACF44397662B732E70DFF4  
SHA1: 38344CDEB7AC9A62F33688087FC2577298E9390C  
SHA256: 05731E767EBC46DA5BAF1D9483EE9D50B354EC3393274743A185F1A0411C4F4C  

Signature for ISO image:  
https://github.com/Security-Onion-Solutions/securityonion/raw/2.4/main/sigs/securityonion-2.4.30-20231219.iso.sig

Signing key:  
https://raw.githubusercontent.com/Security-Onion-Solutions/securityonion/2.4/main/KEYS  

For example, here are the steps you can use on most Linux distributions to download and verify our Security Onion ISO image.

Download and import the signing key:  
```
wget https://raw.githubusercontent.com/Security-Onion-Solutions/securityonion/2.4/main/KEYS -O - | gpg --import -  
```

Download the signature file for the ISO:  
```
wget https://github.com/Security-Onion-Solutions/securityonion/raw/2.4/main/sigs/securityonion-2.4.30-20231219.iso.sig
```

Download the ISO image:  
```
wget https://download.securityonion.net/file/securityonion/securityonion-2.4.30-20231219.iso
```

Verify the downloaded ISO image using the signature file:  
```
gpg --verify securityonion-2.4.30-20231219.iso.sig securityonion-2.4.30-20231219.iso
```

The output should show "Good signature" and the Primary key fingerprint should match what's shown below:
```
gpg: Signature made Mon 18 Dec 2023 05:10:29 PM EST using RSA key ID FE507013
gpg: Good signature from "Security Onion Solutions, LLC <info@securityonionsolutions.com>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: C804 A93D 36BE 0C73 3EA1  9644 7C10 60B7 FE50 7013
```

Once you've verified the ISO image, you're ready to proceed to our Installation guide:  
https://docs.securityonion.net/en/2.4/installation.html
