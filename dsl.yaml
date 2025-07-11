jobs:
    - script:
        def jenkinsEnvironment = ${JENKINS_ENV_GROUP}
        def defaultBranch = "main"

        // Job 1: Gradle build
        job('example-gradle') {
            logRotator(-1, 10)
            jdk('Java 8')
            scm {
                github('jenkinsci/job-dsl-plugin', 'master')
            }
            triggers {
                githubPush()
            }
            steps {
                gradle('clean build')
            }
            publishers {
                archiveArtifacts('build/libs/*.jar')
            }
        }

        // Job 2: Maven build
        job('example-maven') {
            logRotator(-1, 5)
            jdk('Java 11')
            scm {
                github('spring-projects/spring-petclinic', 'main')
            }
            triggers {
                scm('H/15 * * * *')
            }
            steps {
                maven('clean install', 'maven-3.6.3')
            }
            publishers {
                archiveArtifacts('target/*.jar')
            }
        }

        // Job 3: Simple Shell
        job('example-shell') {
            logRotator(-1, 3)
            steps {
                shell('echo "Hello from example-shell job"')
            }
        }

        // Job 4: Pipeline Job
        pipelineJob('example-pipeline') {
            logRotator(-1, 5)
            definition {
                cps {
                    script('''
                        pipeline {
                            agent any
                            stages {
                                stage('Test') {
                                    steps {
                                        echo 'Hello from pipeline job'
                                    }
                                }
                            }
                        }
                    '''.stripIndent())
                    sandbox()
                }
            }
        }

        // Job 5: NodeJS Build
        job('example-nodejs') {
            logRotator(-1, 5)
            wrappers {
                nodejs('NodeJS 14')
            }
            steps {
                shell('npm install && npm test')
            }
        }

        // Job 6: GitHub trigger, shell build
        job('example-github-trigger') {
            scm {
                github('octocat/Hello-World', 'main')
            }
            triggers {
                githubPush()
            }
            steps {
                shell('echo "Building GitHub project..."')
            }
        }

        // Job 7: Cron Trigger
        job('example-cron') {
            triggers {
                cron('H 4 * * *')
            }
            steps {
                shell('echo "Running via CRON trigger"')
            }
        }

        // Job 8: Simple echo, no SCM
        job('example-echo') {
            steps {
                shell('echo "Simple echo job"')
            }
        }