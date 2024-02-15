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
                }
            }
        }
    }
}
