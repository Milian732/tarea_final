pipeline {
    agent {
        node {
            label 'local'
        }
    }
    environment {
        SSH_PASSWD = 'adrian73'
    }
    stages {
        stage('ejecutar script de python') {
            steps {
                script {
                    def chatId = '6400577385'
                    def token = '6971444615:AAHSR3v68P6lesjeZajdw-EM7tPCRnHJyxA'
                    def message = 'Script ejecutado correctamente'
                    sh 'ls';
                    sh 'pepino';
                    sh 'chmod +x python-diff.py';
                    sh './python-diff.py old.xlsx new.xlsx';
                    sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${chatId}\", \"text\": \"${message}\", \"disable_notification\": false}' https://api.telegram.org/bot${token}/sendMessage";
                }
            }
        }
        stage('Pasar el documento generado en markdown a pdf y hacer git push') {
            steps {
                script {
                    def chatId = '6400577385'
                    def token = '6971444615:AAHSR3v68P6lesjeZajdw-EM7tPCRnHJyxA'
                    def message = 'Conversión a PDF y subida a Github realizada correctamente'
                    sh 'pandoc -s Contratos.md -o Contratos.pdf --pdf-engine=wkhtmltopdf';
                    sh 'git config --global user.email \'adrianmilianpalomares@gmail.com\''
                    sh 'git config --global user.name \'Milian732\''
                    sh 'git add .';
                    sh 'git commit -m "Añadido"';
                    withCredentials([usernamePassword(credentialsId: 'GIT', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Milian732/tarea_final.git HEAD:main')
                    }
                    sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${chatId}\", \"text\": \"${message}\", \"disable_notification\": false}' https://api.telegram.org/bot${token}/sendMessage";
                }
            }
        }
        stage('Pasar el meta-script al servidor y ejecutar el script') {
            steps {
                script {
                    sh "sshpass -p $SSH_PASSWD scp -o StrictHostKeyChecking=no meta-script.sh adrian@172.18.0.4:/home/adrian/";
                    sh 'sshpass -p $SSH_PASSWD ssh adrian@172.18.0.4 "chmod +x /home/adrian/meta-script.sh"';
                }
            }
        }            
    }
    post {
        success {
            sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "6400577385", "text": "La Tarea Final se ha realizado correctamente", "disable_notification": false}\'  https://api.telegram.org/bot6971444615:AAHSR3v68P6lesjeZajdw-EM7tPCRnHJyxA/sendMessage'
        }

        failure {
            sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "6400577385", "text": "ERROR: La Tarea Final ha fallado, mira los logs para más información :( ", "disable_notification": false}\'  https://api.telegram.org/bot6971444615:AAHSR3v68P6lesjeZajdw-EM7tPCRnHJyxA/sendMessage'
        }

  }
}
