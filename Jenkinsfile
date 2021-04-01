pipeline {
    agent any
    stages {
        stage ('Checkout') {
            agent { docker { image 'node:vuejs' } }
            steps {
                echo '[CHECKOUT]'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '2495a0c1-83df-4463-be18-0a202c24018c', url: 'http://scm:8080/scm/repo/scmadmin/app-vue']]])
            }
        }
        stage('Test') {
            agent { docker { image 'node:vuejs' } }
            steps {
                echo "[SCRIPT SHELL D'INTÉGRATION]"
                sh 'make --makefile=jenkins.Makefile'

                echo "[PUBLICATION HTML DE LA COUVERTURE DE CODE]"
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'build/coverage/lcov-report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])

                echo 'Exo4: Publication des erreurs checkstyle/pmd avec un seuil a 10'


                echo "[PUBLICATION xUnit DES TESTS UNITAIRES]"
                xunit([JUnit(excludesPattern: '', pattern: 'build/coverage/junit/junit.xml', stopProcessingIfError: true)])

                echo "[PUBLICATION DE LA COUVERTURE DE CODE AVEC UN SEUIL DE 50 %]"
                step([
                  $class: 'CloverPublisher',
                  cloverReportDir: 'build/coverage/',
                  cloverReportFileName: 'clover.xml',
                  healthyTarget: [methodCoverage: 70, conditionalCoverage: 70, statementCoverage: 50],
                  unhealthyTarget: [methodCoverage: 50, conditionalCoverage: 50, statementCoverage: 40],
                  failingTarget: [methodCoverage: 0, conditionalCoverage: 0, statementCoverage: 0]
                ])
            }
        }
    }
    post {
        success {
            echo "[SCRIPT PIPELINE DE CONSTRUCTION DOCKER]"
            // En cas de succès, une image docker de l'application à partir du Dockerfile dans ./src est créé avec le numéro du build comme tag.
            script {
                docker.build("app-vue:${env.BUILD_ID}", "--file vue.Dockerfile ./")
            }
        }
    }
}