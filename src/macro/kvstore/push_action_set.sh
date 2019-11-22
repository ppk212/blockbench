#echo "$1"
#echo "$2"
#echo "./cleos.sh push action kvstore set '[80, \"$1\"]' -p proofer12345"

#echo "./cleos.sh push action kvstore set '[$1, \"$2\"]' -p proofer12345"

./cleos.sh push action kvstore set "[$1, \"$2\"]" -p proofer12345
