# IaC com Terraform

## Princípios de organização

Toda infraestrutura de aplicação é um potencial cluster. Seja com apenas um nó
computacional ou diversos nós, independente de situação financeira ou
cenários de uso, devemos sempre pensar em termos de cluster. 

## Como utilizar?

### Inicializar o Terraform e um módulo de ambiente

* Inicializar e carregar módulo específicado:

```sh
./terraform init live/stage/services/webapp-cluster-simple-instance
```

#### Aplicação 'WebApp' criada de um módulo importado do GitHub

* Ambiente de **Staging**:

```sh
./terraform init live/stage/services/webapp-cluster-simple-instance-imported-gh
```

### Implantar Infraestrutura

#### Aplicação chamada 'WebApp'

* Ambiente de **Staging**:

```sh
./terraform apply -auto-approve live/stage/services/webapp-cluster-simple-instance
```

### Destruir Infraestrutura

* Ambiente de **Staging**:

```sh
./terraform destroy -auto-approve live/stage/services/webapp-cluster-simple-instance
```

## Implantações de outros exemplos

### Criação de 3 usuários do IAM com anexação de policies automatizados com loop e condicionais

```sh
./terraform apply -auto-approve live/global/iam
```