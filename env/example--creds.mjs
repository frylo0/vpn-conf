/** @typedef {import('@frylo/pftp').Configuration} Config */

/** @type {Config} */
export const creds = {
	host: "",
	port: 22,
	protocol: "",
	username: "",
	password: "",

	excludeRegExp: [
		/example--/,
		/^node_modules\//,
	],
};
