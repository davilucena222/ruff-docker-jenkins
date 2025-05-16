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

        stage('Lint: Ruff Check') {
            steps {
                echo '🔍 Rodando análise estática com Ruff...'
                sh 'docker compose run --rm ruff-check'
            }
        }

    }
}