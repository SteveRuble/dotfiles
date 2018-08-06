# dotfiles
My configuration files.


System notes:

When using go + mage + docker:
- Using visudo:
  1. Add the value of $(which go) to secure_path
  2. Add this line:
   ```
   Defaults env_keep += "GOPATH GOROOT"
   ```
  3. Copy mage executable to `/usr/local/bin`
  
 
