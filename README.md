# CrystalLoader
<p align="center">
  <img  src="https://github.com/user-attachments/assets/c9f7bf16-c2d5-4d8d-ba22-008d2bd367b7">
</p>
Offensive Crystal collection repo based on https://crystal-lang.org - WiP 

---
### CrystalLoader.cr
Basic Shellcode Loader using Crystal as a PoC. <br>
Bypasses MDE and Elastic EDR at time of writing (14/12/2024). Elastic still flags on msfvenom shellcode execution *AFTER* it ran based on current stack, improvements and variants are WiP.

### Compiling
```
crystal build CrystalLoader.cr --static --release
```

### CrystalLoader.cr detections (14/12/2024)
#### MDE timeline:
<p align="center">
  <img  src="https://github.com/user-attachments/assets/3f3c7a57-471d-496b-b4c3-693763bd4a55">
  <img  src="https://github.com/user-attachments/assets/dcb85634-de04-475c-b900-5f5e40a7881a">
</p>

#### Elastic detection:
<p align="center">
  <img  src="https://github.com/user-attachments/assets/af2100aa-71f3-415f-a3c2-7c3c8a79823f">
</p>
