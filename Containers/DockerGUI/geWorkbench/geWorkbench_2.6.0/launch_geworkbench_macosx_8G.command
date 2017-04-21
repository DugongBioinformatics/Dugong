logfile=geWorkbench_2.6.0

cd "`dirname "$0"`"
if [ -d jre ] 
then
	./jre/bin/java -cp lib/ant.jar:lib/ant-launcher.jar org.apache.tools.ant.launch.Launcher run8G >> ${HOME}/$logfile.stdout.log 2>> ${HOME}/$logfile.stderr.log
else
	java -cp lib/ant.jar:lib/ant-launcher.jar org.apache.tools.ant.launch.Launcher run8G >> ${HOME}/$logfile.stdout.log 2>> ${HOME}/$logfile.stderr.log
fi