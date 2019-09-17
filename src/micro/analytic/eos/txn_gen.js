const TXNS_PER_BLOCK = 3
const INVOKE_TIMES = 1000

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

var len = 10;
var t = 0;

async function gen_txns(current_block) {
	//var sender_arr = new Array();
	//var receiver_arr = new Array();
	//var val_arr = new Array();

	//for(var i = 0; i < TXNS_PER_BLOCK; ++i) {
  		var x = parseInt(Math.floor(Math.random() * len)); 
    		var y = parseInt(Math.floor(Math.random() * len));
    		var val = String(Math.floor(Math.random() * 100)) + ".0000 EOS";
    		//sender_arr[i] = getNumber(x);
    		//receiver_arr[i] = getNumber(y);
		//val_arr[i] = val;
		var sender = getNumber(x);
		var receiver = getNumber(y);

		//var temp = sender_arr[i] + "@owner";
		var temp = sender + "@owner";
                const transactionOptions = {
                        authorization: [temp]
                }
		if(x!=y) {
                await eos.transfer(sender, receiver, val, 'memo', transactionOptions).then(trx => {
                        var block_num = parseInt(current_block) + 1;
			console.log(sender, " send ", val, " to ", receiver, " in ", block_num, "blocks.");
			//console.log("prev : ", prev_count, "now : ", now_count);
                }).catch(error => {
			//console.log("ERROR! ", sender_arr[i], " can't send ", val_arr[i], " to ", receiver_arr[i]);
			//console.log("Failed...");
                        //console.error(error);
                });
		}
	//}
	t++;

	if (t >= INVOKE_TIMES) {
		console.log("make 3txs per a block. DONE.");
		process.exit();
	}
}

function getNumber(num) {
	var str = "experiment";
	var temp = parseInt(num / 5);

	temp++;
	str += String(temp);

	temp = parseInt(num % 5);
	temp++;
	str += String(temp);

	return str;
}

var prev_count = 0;
var now_count = 0;

console.log("Start generating txns....");

setInterval(function(){
	eos.getInfo((error,info) => {
		if(error) {
			console.error(error);        
		}

		try {
			now_count = parseInt(info.head_block_num);
			//console.log("Block Count = ", now_count);
			//console.log("prev : ", prev_count, "now : ", now_count);
			if(prev_count != now_count) {
				prev_count = now_count;
				gen_txns(now_count);
			}
		}
		catch (error) {
			console.log(error);
		}
	});
},300);
