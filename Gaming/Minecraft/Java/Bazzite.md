
# Troubleshooting 

## Something went wrong

Fix this "Something went wrong" login error by switching to the Prism Launcher native Flatpak app instead of the official Minecraft launcher. The official launcher frequently breaks on Bazzite and Linux due to issues with embedded Microsoft web-authentication, whereas Prism provides native login without errors.

### Option 1: Fix Authentication Files
Corrupted web caches frequently trigger this error.
- Go to your home directory, and unhide hidden folders (Ctrl+H).
- Navigate to ```~/.var/app/com.mojang.minecraftlauncher/data/minecraft/webcache2```.
- Delete all the files inside the ```webcache2``` folder, and restart the launcher.

### option 2: Switch to Prism Launcher
1. Open your terminal or your application grid (Discover/Software Center).
2. Install Prism Launcher as a Flatpak: flatpak install flathub org.prismlauncher.PrismLauncher
3. Open Prism Launcher and complete the setup wizard.
4. Go to Settings > Accounts > Microsoft, and click Add Account.
5. Follow the inline URL verification process to log into your Microsoft Account.

