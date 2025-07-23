pipeline {
    agent any

    // triggers {
    //     cron('*/1 * * * *')
    // }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Mensagem') {
            steps {
                echo 'Olá, Jenkins!'
            }
        }

    }
}
