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
        stage('Conectar local') {
            steps {
                script {
                    sh 'ls';
                    sh 'chmod +x python-diff.py';
                    sh './python-diff.py old.xlsx new.xlsx';
                    sh "sshpass -p $SSH_PASSWD scp -o StrictHostKeyChecking=no meta-script.sh adrian@172.18.0.4:/home/adrian/";
                    sh 'sshpass -p $SSH_PASSWD ssh adrian@172.18.0.4 "chmod +x /home/adrian/meta-script.sh"';
                    sh 'sshpass -p $SSH_PASSWD ssh adrian@172.18.0.4 "./home/adrian/meta-script.sh"';
                    def chatId = '6400577385'
                    def token = '6971444615:AAHSR3v68P6lesjeZajdw-EM7tPCRnHJyxA'
                    def message = 'Funcionó la tarea noti-telegram!!'
                    sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${chatId}\", \"text\": \"${message}\", \"disable_notification\": false}' https://api.telegram.org/bot${token}/sendMessage";
                }
            }
        }
    }
}
