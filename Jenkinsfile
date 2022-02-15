pipeline {
  agent {
    docker {
      image 'quay.io/roboll/helmfile:v0.143.0'
      args '-u 0:0'
    }
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
    ansiColor('xterm')
    timeout(time: 60, unit: 'MINUTES')
    disableConcurrentBuilds(abortPrevious: true)
  }

  triggers {
    cron(env.BRANCH_NAME == 'master' ? 'H/30 * * * *' : '')
  }

  environment {
    KUBECONFIG = credentials('halkeye-digitalocean-kubeconfig')
    PGP_PRIVATE_KEY = credentials('jenkins-gpg-secret')
    GPG_TRUST = credentials('jenkins-gpg-ownertrust')
    GPG_PASSPHRASE = credentials('jenkins-gpg-passphrase')
  }

  stages {
    stage('Prepare Environment'){
      steps {
        sh 'apk add gnupg'
        sh 'kubectl cluster-info > /dev/null'
        sh '''
          cat "${PGP_PRIVATE_KEY}" | gpg --batch --import || true
          echo "${GPG_PASSPHRASE}" | gpg --batch --always-trust --yes --passphrase-fd 0 --pinentry-mode=loopback -s > /dev/null
        '''
      }
    }
    stage('Make sure cert-manager is installed'){
      steps {
        sh 'kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml'
        sh 'sops -d cert-manager-cluster-issuer-secrets.yml | kubectl apply -f -'
      }
    }
    stage('Helmfile Lint'){
      steps {
        sh 'helmfile lint'
      }
    }
    stage('Diff on Pull Request'){
      when { changeRequest() }
      steps {
        script {
          def diff = sh(
            script:'helmfile --no-color -f "clusters/${K8S_CLUSTER}.yaml" diff --suppress-secrets --skip-deps --context=2 --concurrency=8',
            returnStdout: true,
          ).trim()
          // Note the GitHub markdown formatting for the diff, to have syntax coloration
          publishChecks name: "helmfile-diff", title: "Helmfile Diff", text: '```diff\n' + diff + '\n```'
        }
      }
    }
    stage('Apply'){
      when { branch 'main' }
      steps {
        sh 'helmfile apply --suppress-secrets --concurrency=8'
      }
    }
  }
}


