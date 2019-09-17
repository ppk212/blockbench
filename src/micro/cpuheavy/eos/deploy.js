const Eos = require('eosjs');
const BigNumber = require('bignumber.js');

const eos = Eos({
	chainId: 'cd216ee824bdc68ab8931d98d1d619497fef7e2906d660084884af14bfa87049',
	keyProvider: [
		"5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3",
		"5KMB2Zc96CAHQgMSv52DVadEFruFYTDLpaKHFLW1ncLJWbydTYg"
	],
	httpEndpoint: "http://127.0.0.1:8011",
	broadcast: true,
	verbose: false,
	sign: true
});

var timestamp;
var timenow;

function sendTxn(size) {
	eos.contract('cpuheavy').then(cpuheavy => {
		console.log('size -> {}', size);
		//console.log('cpuheavy -> {}', cpuheavy);
		cpuheavy.sort(
			size,
			{
				authorization: "cpuheavy@active"
			}
		).then( r => {
			//console.log('r => {}', r);
			timenow = new Date().getTime();
			console.log(process.argv[2] + " numbers sorted. took " 
				+ (timenow - timestamp)/1000 + " sec");
			process.exit();
		});
	});
}

console.log("before send: " + new Date().getTime());
sendTxn(parseInt(process.argv[2]));
timestamp = new Date().getTime();
console.log("after send: " + timestamp);
