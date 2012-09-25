from __future__ import with_statement
from fabric.api import local, settings, abort, run, cd
from fabric.contrib.console import confirm
import time

JETTY_DIR='/opt/jetty/webapps'
WORKSPACE_PATH='/home/hudson/.hudson/jobs/PhotoView/workspace/PhotoView'
WAR_NAME='PhotoView-0.1.war'

WAR_PATH="{}/target/{}".format(WORKSPACE_PATH,WAR_NAME)

def deploy():
	local("psql -U photoview -c 'drop table if exists photo;' photoview")

	with settings(warn_only=True):
		local("{}/stop-solr.sh 8984 solr".format(WORKSPACE_PATH))
		time.sleep(20)
	
	local("{}/start-solr.sh 8983 8984 solr".format(WORKSPACE_PATH))
	time.sleep(20)

	local("{}/clear_solr.sh 8983".format(WORKSPACE_PATH))

	with settings(warn_only=True):
    		local("rm {}/{}".format(JETTY_DIR,WAR_NAME))
		time.sleep(10)

	local("cp {} {}/.".format(WAR_PATH,JETTY_DIR))
		

