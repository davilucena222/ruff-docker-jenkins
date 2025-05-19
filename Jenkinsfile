node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Docker') {
        echo '🔧 Buildando imagem com Docker Compose...'
        sh 'docker compose build --no-cache'
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

    stage('Próxima Etapa') {
        echo '🚀 Continuando pipeline normalmente mesmo com falha no Ruff...'
        // Exemplo: sh 'docker compose up -d app'
    }
}
