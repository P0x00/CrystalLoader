# CrystalLoader
Offensive Crystal repo based on [Crystal Language](https://crystal-lang.org/) - WIP 

---
### CrystalLoader.cr
Basic Shellcode Loader using Crystal as a PoC. <br>
Bypasses MDE and Elastic EDR at time of writing (14/12/2024). Elastic still flags on msfvenom shellcode execution *AFTER* it ran, improvements are WiP.

### Compiling
```
crystal build CrystalLoader.cr --static --release
```

### CrystalLoader.cr detections (14/12/2024)
#### MDE timeline:
![image](https://github.com/user-attachments/assets/3f3c7a57-471d-496b-b4c3-693763bd4a55)
![image](https://github.com/user-attachments/assets/dcb85634-de04-475c-b900-5f5e40a7881a)

#### Elastic detection:

![image](https://github.com/user-attachments/assets/af2100aa-71f3-415f-a3c2-7c3c8a79823f)
