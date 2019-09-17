const Eos = require('eosjs');

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

var start_key = parseInt(process.argv[2]);
var size = parseInt(process.argv[3]);

var timestamp;

function sendTxn(start_key, size) {
	eos.contract('ioheavy').then(ioheavy => {
                //console.log('size -> {}', size);
                //console.log('ioheavy -> {}', ioheavy);
                ioheavy.write(
			start_key,
                        size,
                        {
                                authorization: "ioheavy@active"
                        }
                ).then( r => {
                        //console.log('r => {}', r);
                        timenow = new Date().getTime();
                        console.log( size + " key-value written. took "
                                + (timenow - timestamp)/1000 + " sec");
                        process.exit();
                });
        });
}

sendTxn(start_key, size);
timestamp = new Date().getTime();
