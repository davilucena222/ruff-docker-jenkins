pipeline {
    agent any

    triggers {
        cron('*/1 * * * *')
    }

    parameters {
        booleanParam(name: 'RODAR_RUFF', defaultValue: true, description: 'Executar Ruff Check?')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Atualiza descrição do build') {
            steps {
                script {
                    currentBuild.description = '<a href="https://example.com" target="_blank">🔗 Link para artefato</a>'
                }
            }
        }


        stage('Build Docker') {
            steps {
                echo '🔧 Buildando imagem com Docker Compose...'
                sh 'docker compose build --no-cache'
            }
        }

        stage('Info') {
            steps {
                echo "Branch atual: ${env.BRANCH_NAME}"
                echo "CHANGE_ID: ${env.CHANGE_ID ?: 'n/a'}"
                echo "Origem da PR: ${env.CHANGE_BRANCH ?: 'n/a'}"
                echo "Destino da PR: ${env.CHANGE_TARGET ?: 'n/a'}"
            }
        }

    }
}
