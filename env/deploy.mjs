import { deploy } from '@frylo/pftp';

import { fryloCreds, rootCreds } from './creds.mjs';

import { fileURLToPath } from 'url';
import path, { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

async function main() {
	console.log('\n(1/3) Uploading home folder\n');

	await deploy({
		...fryloCreds,

		localFolder: path.join(__dirname, "./../src/home"),
		remoteFolder: `/home/${fryloCreds.username}/vpn`,

		excludeRegExp: [
			...fryloCreds.excludeRegExp,
			/^pptp\-install\//,
		],
	});

	console.log('\n\n(2/3) Uploading vpn.frylo.org\n');

	await deploy({
		...rootCreds,

		localFolder: path.join(__dirname, './../src/vpn.frylo.org'),
		remoteFolder: `/var/www/vpn.frylo.org`,
	});

	console.log('\n\n(3/3) Uploading etc folders\n');

	await deploy({
		...rootCreds,

		localFolder: path.join(__dirname, './../src/etc'),
		remoteFolder: `/etc`,

		customLftpOptions: {
			mirrorCommandOptions:
				"--reverse --only-newer --verbose=2 --ignore-time --parallel=10",
		},
	});
}

main().catch(console.error).finally(process.exit);
