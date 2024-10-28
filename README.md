# vpn-conf

Project to simplify launch of VPN instance on new VPS/VDS.

- [How to use?](#how-to-use)
	- [Deployment](#deployment)
- [Creds](#creds)


## How to use?

### Deployment

```bash
nvm use
pnpm i
cp ./env/example--creds.mjs ./env/creds.mjs && vi ./env/creds.mjs # Put creds for SSH
pnpm upload

# Then connect to server and run script
ssh root@vps-server-ip
cd ~/vpn/scripts
chmod +x ./init-from-root.sh
./init-from-root.sh
exit
```

## Creds

Git setup ignores creds files to increase security of VPN. No launch new instance use `example--` files to create the real files with creds.

Creds files:

- `./env/creds.mjs` - Stores SSH creds for deployment script
- `./src/etc/ppp/chap-secrets` - Stores creds for PPTP VPN connections
- `./src/home/scripts/creds.sh` - Stores creds for creation of Ubuntu sudo user
- `./src/vpn.frylo.org/creds.php` - Stores creds for HTTP Auth for VPN control panel website

