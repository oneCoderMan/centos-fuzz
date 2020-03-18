pipeline {
  agent any
  stages {
    stage('start sync') {
      steps {
        sh '''ls
        chmod +x ./infra/gcb/sync.py
./infra/gcb/sync.py'''
      }
    }
  }
}