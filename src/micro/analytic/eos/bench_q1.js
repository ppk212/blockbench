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

var start_block = parseInt(process.argv[2]);
var end_block = parseInt(process.argv[3]);

var total;
var t;
var timestamp;

async function get_total() {
	total = 0;
	t = start_block;
	for(var index = start_block; index <= end_block; index++) {
		//console.log("index = ", index, " / end_block = ", end_block);
		await eos.getBlock(index, (error,info) => {
			//console.log("t = ", t, " / end_block = ", end_block);
			if(error) {
				console.error(error);
			}
			try {
				var data;
				data = info.transactions[0];
	
				//console.log("t = ", t, " / end_block = ", end_block);
				data = info.transactions[0].trx.transaction.actions[0].data.quantity;
				if(data != null) {
					total += parseInt(String(data).replace(".0000 EOS", ""));
					//console.log(data);
					//console.log(t,"Blocks, ","Add ", parseInt(String(data).replace(".0000 EOS", "")));
					//console.log("Total : ", total);
				}

				if(t == end_block) {
                                        console.log("the total transaction values: " + total);
                                        console.log("Latency: "+((new Date().getTime()-timestamp)/1000)+" sec");
                                        process.exit();
                                }
				//console.log("t = ", t, " / end_block = ", end_block);
			}
			catch (error) {
				//console.log(error);
			}
			t++;
		});
	}
}

timestamp = new Date().getTime();
get_total();
