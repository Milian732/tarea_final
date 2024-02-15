pipeline {
    agent {
        node {
            label 'local'
        }
    }
    stages {
        stage('Conectar local') {
            steps {
                sh '';
                sh 'ls';
                sh 'chmod +x python-diff.py';
                sh './python-diff.py old.xlsx new.xlsx';
            }
        }
    }
}
