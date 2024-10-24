/** @typedef {import('@frylo/pftp').Configuration} Config */

/** @type {Config} */
const base = {
	host: "",
	port: 22,
	protocol: "",
	progress: 'bar',
};

const excludeRegExp = [
	/example--/,
	/^node_modules\//,
];

/** @type {Config} */
export const fryloCreds = {
	...base,

	username: "",
	password: "",

	excludeRegExp,
};

/** @type {Config} */
export const rootCreds = {
	...base,

	username: "",
	password: "",

	excludeRegExp,
};
