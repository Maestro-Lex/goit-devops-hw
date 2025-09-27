# Фінальний проєкт: Розгортання інфраструктури DevOps на AWS

## Структура проєкту

    final project/
    │
    ├── main.tf                  # Головний файл для підключення модулів
    ├── backend.tf               # Налаштування бекенду для стейтів (S3 + DynamoDB)
    ├── jenkins.tf
    ├── outputs.tf               # Загальне виведення ресурсів
    ├── variables.tf
    ├── django.yaml
    │
    ├── modules/                 # Каталог з усіма модулями
    │   │
    │   ├── s3-backend/          # Модуль для S3 та DynamoDB
    │   │   ├── s3.tf            # Створення S3-бакета
    │   │   ├── dynamodb.tf      # Створення DynamoDB
    │   │   ├── variables.tf     # Змінні для S3
    │   │   └── outputs.tf       # Виведення інформації про S3 та DynamoDB
    │   │
    │   ├── vpc/                 # Модуль для VPC
    │   │   ├── vpc.tf           # Створення VPC, підмереж, Internet Gateway
    │   │   ├── routes.tf        # Налаштування маршрутизації
    │   │   ├── variables.tf     # Змінні для VPC
    │   │   └── outputs.tf       # Виведення інформації про VPC
    │   │
    │   ├── ecr/                 # Модуль для ECR
    │   │   ├── ecr.tf           # Створення ECR репозиторію
    │   │   ├── variables.tf     # Змінні для ECR
    │   │   └── outputs.tf       # Виведення URL репозиторію ECR
    │   │
    │   ├── eks/                 # Модуль для Kubernetes кластера
    │   │   ├── eks.tf           # Створення кластера
    │   │   ├── variables.tf     # Змінні для EKS
    │   │   └── outputs.tf       # Виведення інформації про кластер
    │   │
    │   ├── monitoring/          # Модуль для моніторингу
    │   │   ├── prometheus.tf
    │   │   ├── variables.tf
    │   │   ├── values.yaml
    │   │   └── outputs.tf
    │   │
    │   ├── rds/                 # Модуль для RDS
    │   │   ├── rds.tf           # Створення RDS бази даних
    │   │   ├── aurora.tf        # Створення aurora кластера бази даних
    │   │   ├── shared.tf        # Спільні ресурси
    │   │   ├── variables.tf     # Змінні (ресурси, креденшели, values)
    │   │   └── outputs.tf
    │   │
    │   ├── jenkins/             # Модуль для Helm-установки Jenkins
    │   │   ├── jenkins.tf       # Helm release для Jenkins
    │   │   ├── variables.tf     # Змінні (ресурси, креденшели, values)
    │   │   ├── providers.tf     # Оголошення провайдерів
    │   │   ├── values.yaml      # Конфігурація jenkins
    │   │   └── outputs.tf       # Виводи (URL, пароль адміністратора)
    │   │
    │   └── argo_cd/             # Модуль для Helm-установки Argo CD
    │       ├── jenkins.tf       # Helm release для Jenkins
    │       ├── variables.tf     # Змінні (версія чарта, namespace, repo URL тощо)
    │       ├── providers.tf     # Kubernetes+Helm.  переносимо з модуля jenkins
    │       ├── values.yaml      # Кастомна конфігурація Argo CD
    │       └── outputs.tf       # Виводи (hostname, initial admin password)
    │		    └──charts/                  # Helm-чарт для створення app'ів
    │ 	 	    ├── Chart.yaml
    │	  	    └── values.yaml          # Список applications, repositories
    │			    └── templates/
    │		        ├── application.yaml
    │		        └── repository.yaml
    │
    ├── charts/
    │   └── django-app/
    │       ├── templates/
    │       │   ├── deployment.yaml
    │       │   ├── service.yaml
    │       │   ├── configmap.yaml
    │       │   └── hpa.yaml
    │       ├── Chart.yaml
    │       └── values.yaml
    │
    ├── Django/
    │   └── goit/
    │       ├── templates/
    │       │   ├── __init__.py
    │       │   ├── asgi.py
    │       │   ├── settings.py
    │       │   ├── urls.py
    │       │   └── wsgi.py
    │       ├── Dockerfile
    │       ├── manage.py
    │       └── requirements.txt
    │
    └── README.md                # Документація проєкту

## Опис проєкту

Інфраструктура DevOps на AWS з використанням Terraform, що включає наступні компоненти:

- Розгортання Kubernetes кластера (EKS) з підтримкою CI/CD
- Інтеграція Jenkins для автоматизації збірки та деплою
- Інсталяція Argo CD для управління застосунками
- Налаштування бази даних (RDS або Aurora)
- Організація контейнерного реєстру (ECR)
- Моніторинг з Prometheus та Grafana

1. Модуль s3-backend керує налаштуваннями для зберігання та блокування terraform states. Він створює S3-bucket для зберігання Terraform state та DynamoDB table для блокування стейтів.

2. Модуль vpc/ використовується для налаштування віртуального мережевого простору. Створює Virtual Private Cloud (VPC) з трьома публічними підмережами для доступу в Інтернет через шлюз та трьома приватними підмережами з доступом до Інтернету через NAT Gateway. Керує маршрутизацією за відповідними таблицями.

3. Модуль ecr/ створює ECR репозиторій з автоматичним скануванням образів.

4. Модуль eks/ створює EKubernetes кластер.

5. Charts/django-app/ власний Helm-чарт для Django-проєкту

6. Модулі jenkins/ та argo_cd/ відповідають за CI/CD

7. Модуль rds/ відповідає за налаштуваня бази даних

## Порядок ініціалізації та запуску

> <span><span style="color: red"><b>Увага!</b></span> Перед запуском проєкту у вас має бути налаштовані AWS credentials у вашій CLI! Використовуйте <b><i>aws configure</i></b> для налаштувань.</span>  
> <span>Також вміст файлу <b><i>backend.tf</i></b> при першій ініціалізації має бути закоментований.</span>

<p>Ініціалізація проєкту перед виконанням здійснюється командою <b><i>terraform init</i></b>.</p>
<p>Для перевірки змін та того, що буде виконано, використовуємо команду <b><i>terraform plan</i></b>.</p>

<p>Для застосування змін використовуємо команду <b><i>terraform apply</i></b>.</p>

> <span><span style="color: red"><b>Увага!</b></span> Для створення файлу конфігурації стейту та копіювання його на s3-bucket після виконання попередньої команди розкоментуйте файл <b><i>backend.tf</i></b> та виконайте команду <b><i>terraform init -reconfigure</i></b>.</span>

<p>Для видалення створених ресурсів використовуємо команду <b><i>terraform destroy</i></b>.</p>

> <span><span style="color: red"><b>Увага!</b></span> Ресурс <b><i>s3-bucket</i></b> буде видалено лише якщо сховище порожнє.</span>

<p>Для розгортання кластеру оновлюємо <b><i>kubeconfig</i></b>. Стан кластера:</p>

```bash
aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>
kubectl get nodes
```

<p>Перевіряємо <b><i>Jenkins</i></b></p>

```bash
kubectl get all -n jenkins
kubectl port-forward svc/jenkins 8080:8080 -n jenkins
```

<p>Перевіряємо <b><i>Argo CD:</i></b></p>

```bash
kubectl get all -n argocd
kubectl port-forward svc/argocd-server 8081:443 -n argocd
```

## Результат

<p>Перевірка Prometheus</p>
<img src="final project/img/prometheus.png">

<p>Моніторінг через Grafana</p>

```bash
kubectl get all -n monitoring
kubectl port-forward svc/grafana 3000:80 -n monitoring
```
