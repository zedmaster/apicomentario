
# Arquitetura  da Aplicação

Para automatizar esta aplicação, serão utilizado ferramentas de containers para realizar o build e o deploy da aplicação.
A utilização de workflows do Github irá ajudar na atomatização do build, gerando a imagem do Docker.

A metodologia de automação será a do GitOps.
GitOps é uma prática de operações de TI (Ops) que enfatiza o uso do controle de versão do Git para gerenciar a infraestrutura e a automação de implantação. Em essência, GitOps trata a infraestrutura como código (IaC), aplicando os princípios de desenvolvimento de software para o gerenciamento da infraestrutura.

Para realizar esta automação, contaremos com ferramentas como o ArgoCD, Kind, Kustomize dentre outras.
O fluxo consiste na atualização automatica do POD da aplicação quando qualquer commit for realizado no branch main, gerando mais autonomia, controle e facilidade para os desenvolvedores, que utilizarão uma inferface web para manipular e monitorar as aplicações.





Ferramentas utilizadas:
* Kind -  (Kubernetes IN Docker) é uma ferramenta que permite criar clusters Kubernetes usando contêineres Docker como nodes.
* kubectl - é uma ferramenta de linha de comando utilizada para interagir com clusters Kubernetes. 
* Kustomize - Kustomize é uma ferramenta de linha de comando usada para personalizar configurações de recursos Kubernetes de forma declarativa. 
* ArgoCD - ArgoCD é uma ferramenta de entrega contínua (Continuous Delivery - CD) projetada especificamente para ambientes Kubernetes. Ele automatiza o processo de implantação de aplicativos em clusters Kubernetes, permitindo que você mantenha um estado desejado definido por meio de configuração declarativa no Git.
* Docker - Docker é uma plataforma de software que permite a criação, o envio e a execução de aplicativos em contêineres. Um contêiner é uma unidade de software leve e portátil que inclui tudo o que um aplicativo precisa para ser executado de forma independente, incluindo código, bibliotecas, dependências e variáveis de ambiente.

# Kind


O Kind, que significa "Kubernetes IN Docker", é uma ferramenta que facilita a execução de clusters Kubernetes em Docker. Ele foi projetado para simplificar o processo de desenvolvimento, teste e experimentação com o Kubernetes, permitindo que você crie clusters Kubernetes em contêineres Docker em sua máquina local.

A escolha para utilização do kind para este teste foi por conta da facilidade de manipulação dos comandos e familiaridade com a ferramenta para desenvolvimento local.


## Instalação do kind


Criando o cluster para a aplicação:
```
kind create cluster --name=apicomentario
```

Aplicando o contexto do kubectl do novo cluster:
```
kubectl cluster-info --context kind-apicomentario 
```


# Kustomize


Instalando o kustomize:
```
sudo snap install kustomize
```


# Instalando ArgoCD
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install argocd
argocd admin initial-password -n argocd
```


Para subir a aplicação localmente:
```
kubectl port-forward service/pyserver-service 8000:8000
```