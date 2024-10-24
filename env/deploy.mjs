import { deploy } from '@frylo/pftp';

import { creds } from './creds.mjs';

import { fileURLToPath } from 'url';
import path, { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

async function main() {
	console.log('(1/3) Uploading home folder');

	await deploy({
		...creds,

		localFolder: path.join(__dirname, "./../src/home"),
		remoteFolder: `/home/${creds.username}/vpn`,
	});

	console.log('(2/3) Uploading vpn.frylo.org');

	await deploy({
		...creds,

		localFolder: path.join(__dirname, './../src/vpn.frylo.org'),
		remoteFolder: `/var/www/vpn.frylo.org`,
	});

	console.log('(3/3) Uploading etc folders');

	await deploy({
		...creds,

		localFolder: path.join(__dirname, './../src/etc'),
		remoteFolder: `/etc`,

		customLftpOptions: {
			mirrorCommandOptions:
				"--reverse --only-newer --verbose=2 --ignore-time --parallel=10",
		},
	});
}

main().finally(process.exit);
