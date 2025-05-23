def getbranch() {
    return env.BRANCH_NAME
}

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker') {
            steps {
                echo '🔧 Buildando imagem com Docker Compose...'
                sh 'docker compose build --no-cache'
            }
        }

        stage("verificando branch 3") {
            steps {
                script {
                    def branchName = getbranch()
                    echo "Branch atual: ${branchName}"
                }
            }
        }

        stage('Lint: Ruff Check') {
            steps {
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                        sh 'docker compose run --rm ruff-check ls -la'
                    }
                }
            }
        }
    }
}