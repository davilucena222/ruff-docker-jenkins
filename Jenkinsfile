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

    }
}
