#!/usr/bin/env groovy

node('BuildServer'){
	def workspace = pwd()
	stage('SCM'){
		checkout scm
		branchName = env.BRANCH_NAME
		echo "Branch name : ${branchName}"
		gitCommit = sh(returnStdout:true,script:'git rev-parse HEAD').trim()
		gitUrl = sh(returnStdout: true, script: 'grep url .git/config | cut -d "=" -f2 ').trim()
		mavenBuild()
	}
}

def mavenBuild(){
	stage('Maven'){
		withEnv(["JAVA_HOME=${ tool 'JDK-1.6'}", "PATH+MAVEN=${tool 'Maven-3.4'}/bin:${env.JAVA_HOME}/bin]) {
			sh "mvn -B -s $workspace/settings.xml clean compile package"
		}
	}
}
