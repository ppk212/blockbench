WALLET_PASS="$( jq -r '.WALLET_PASSWD' "00_CONFIG.conf" )"
INIT_ACCOUNT="$( jq -r '.EXP1_ACCOUNT' "./00_CONFIG.conf" )"
INIT_PUB_KEY="$( jq -r '.EXP1_PUB_KEY' "./00_CONFIG.conf" )"
INIT_PRIV_KEY="$( jq -r '.EXP1_PRIV_KEY' "./00_CONFIG.conf" )"
INIT_URL="$( jq -r '.EXP1_URL' "./00_CONFIG.conf" )"

./cleos.sh wallet open
./cleos.sh wallet unlock <<< $WALLET_PASS
./cleos.sh wallet import <<< $INIT_PRIV_KEY
./cleos.sh system regproducer $INIT_ACCOUNT $INIT_PUB_KEY "$INIT_URL" -p $INIT_ACCOUNT
./cleos.sh system delegatebw $INIT_ACCOUNT $INIT_ACCOUNT "100000000.0000 EOS" "50000000.0000 EOS"
./cleos.sh system voteproducer prods $INIT_ACCOUNT $INIT_ACCOUNT -p $INIT_ACCOUNT
