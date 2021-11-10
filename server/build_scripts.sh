#!/bin/bash

run_servers() {
  # shellcheck disable=SC2164
  cd server
  nohup mvn exec:java@Server -Dexec.args="-p 5000 -s 1" > /dev/null 2>&1 &
  sleep 15
}

# shellcheck disable=SC2181
move_outputs() {
  ls | grep "outputs" -q
  if [[ "$?" -ne 0 ]] ; then
    mkdir outputs
    echo "outpus has been created"
  else
    echo "outsputs is there"
  fi
  cp target/*-jar-with-dependencies.jar outputs/QuoteServer.jar
  if [[ "$?" -ne 0 ]] ; then
    echo "no jar to move"
  else
    echo "jar has been moved"
  fi
}

# shellcheck disable=SC2264
docker_image() {
#  docker login gitlab.wethinkco.de:5050
  docker build -t gitlab.wethinkco.de:5050/lstanley/uss-yosemite .
  docker push gitlab.wethinkco.de:5050/lstanley/uss-yosemite
}

close_servers() {
  jps |grep Launcher |awk '{print $1}' |xargs kill -9
}

clean_code() {
  mvn clean
}

verify_code() {
  mvn verify
}

compile_code() {
  mvn compile
}

unit_test() {
    nohup java -jar /target/*-jar-with-dependencies.jar > /dev/null 2>&1 &
    sleep 5
    mvn test
}

case $1 in
  "compile") compile_code;;
  "verify") verify_code;;
  "clean_code") clean_code;;
  "unit_test") unit_test;;
  "run_servers") run_servers;;
  "close_servers") close_servers;;
  "move_outputs") move_outputs;;
  "docker_image") docker_image;;
  *) echo "Unsupported function" ;;
esac