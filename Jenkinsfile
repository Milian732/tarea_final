pipeline {
    agent {
        node {
            label 'local'
        }
    }
    stages {
        stage('Conectar local') {
            steps {
                sh 'ls';
                sh 'chmod +x python-diff.py';
                sh './python-diff.py old.xlsx new.xlsx';
                sh "sshpass -p "adrian73" scp -o StrictHostKeyChecking=no meta-script.sh adrian@172.18.0.4:/home/adrian/";
            }
        }
    }
}
