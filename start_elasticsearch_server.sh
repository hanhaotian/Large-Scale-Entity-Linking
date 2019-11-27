ES_PORT=9200
ES_PATH=""
ES_BIN=/home/wdps1936/elasticsearch-2.4.1/bin/elasticsearch

>.es_log*
prun -v -np 1 ESPORT=$ES_PORT $ES_BIN </dev/null 2> .es_node &
echo "waiting for elasticsearch to set up..."
until [ -n "$ES_NODE" ]; do ES_NODE=$(cat .es_node | grep '^:' | grep -oP '(node...)'); done
ES_PID=$!
#until [ -n "$(cat .es_log* | grep YELLOW)" ]; do sleep 1; done
echo "elasticsearch should be running now on node $ES_NODE:$ES_PORT (connected to process $ES_PID)"

ES_PATH="$ES_NODE:$ES_PORT"
#python elasticsearch.py $ES_NODE:$ES_PORT "Vrije Universiteit Amsterdam"