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

        stage('Lint: Ruff Check - PR 2') {
            when {
                expression {
                    return env.CHANGE_ID != null
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

        stage('Lint: Ruff Check - BRANCH MAIN NOW') {
            when {
                expression {
                    return env.CHANGE_ID == null
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
