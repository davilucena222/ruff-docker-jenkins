pipeline {
    agent any

    parameters {
        booleanParam(name: 'RODAR_RUFF', defaultValue: true, description: 'Executar Ruff Check?')
    }

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

        stage('Lint: Ruff Check - Pull Request') {
            when {
                changeRequest()
            }

            steps {
                script {
                    if (params.RODAR_RUFF) {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            echo '🧪 Executando Ruff Check...'
                            sh 'docker compose run --rm ruff-check'
                        }
                    } else {
                        echo '⚠️ Ruff Check pulado conforme configuração.'
                    }
                }
            }
        }

        stage('Lint: Ruff Check - BRANCH') {
            when {
                not {
                    changeRequest()
                }
            }

            steps {
                script {
                    if (params.RODAR_RUFF) {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            echo '🧪 Executando Ruff Check...'
                            sh 'docker compose run --rm ruff-check'
                        }
                    } else {
                        echo '⚠️ Ruff Check pulado conforme configuração.'
                    }
                }
            }
        }
    }
}
