#!/bin/sh

NAME=unicorn
PORT=5001
ENVIRONMENT=development

SCRIPT_DIR=`dirname $0`
ROOT_DIR=$(cd "${SCRIPT_DIR}/../"; pwd)
PID="${ROOT_DIR}/tmp/pids/unicorn_tazuu.pid"

start()
{
  if [ -e $PID ]; then
    echo "$NAME already started";
    exit 1;
  fi

  echo "Start $NAME"
  echo "bundle exec unicorn_rails -c ${ROOT_DIR}/config/unicorn/${ENVIRONMENT}.rb -p ${PORT} -E ${ENVIRONMENT} -D"
  bundle exec unicorn_rails -c ${ROOT_DIR}/config/unicorn/${ENVIRONMENT}.rb -p ${PORT} -E ${ENVIRONMENT} -D
}

stop()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started";
    exit 1;
  fi

  echo "Stop $NAME"

  kill `cat ${PID}`
  rm -f $PID
}

graceful_stop()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started";
    exit 1;
  fi

  echo "Graceful stop $NAME"

  kill -QUIT `cat ${PID}`
  rm -f $PID
}

reload()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started";
    start
    exit 0;
  fi

  echo "Reload $NAME"

  kill -USR2 `cat ${PID}`
}

restart()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started";
    start
    exit 0;
  fi

  echo "Restart $NAME"
  stop
  start
}



case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  graceful_stop)
    graceful_stop
    ;;
  reload)
    reload
    ;;
  restart)
    restart
    ;;
  *)
    echo "Argument error: unicorn [start|stop|graceful_stop|reload|restart]"
    ;;
esac

