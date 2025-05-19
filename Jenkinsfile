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
            echo '🔍 Rodando análise estática com Ruff...'
            
            try {
                sh 'docker compose run --rm ruff-check'
                echo '✅ Ruff passou sem erros.'
            } catch (err) {
                echo "⚠️ Erro detectado no Ruff: ${err}"
                currentBuild.result = 'UNSTABLE' // ou 'FAILURE' se quiser marcar como falha
            }
        }
    }
}
