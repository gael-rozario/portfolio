#import "@preview/simple-technical-resume:0.1.1": *

#let name = "Gael Rozario"
#let phone = "+91 9895581044"
#let email = "hi@gaelrozario.com"
#let github = "gael-rozario"
#let linkedin = "gael-rozario-834171181"
#let personal-site = "gaelrozario.com"

#show: resume.with(
  top-margin: 0.3in,
  bottom-margin: 0.15in,
  left-margin: 0.25in,
  right-margin: 0.25in,
  font-size: 10pt,
  personal-info-font-size: 8.5pt,
  author-position: center,
  personal-info-position: center,
  author-name: name,
  phone: phone,
  email: email,
  website: personal-site,
  linkedin-user-id: linkedin,
  github-username: github
)

DevOps Engineer with 10+ years of experience automating cloud infrastructure across AWS and Azure, specializing in Kubernetes, Terraform, CI/CD, and observability. Passionate about AI-augmented developer workflows and an avid Neovim user, always looking to integrate modern tooling to accelerate delivery and improve engineering quality.

#custom-title("Experience")[
  #work-heading(
    "Lead DevOps Engineer",
    "Digit88",
    "Bengaluru",
    datetime(year: 2022, month: 10, day: 30),
    "Present"
  )[
    - Automated full tenant stack provisioning (secrets, databases, k8s apps, IDP, lambda APIs, data platform), reducing SAAS delivery time from ~6 months to 1 week
    - Modernizing application which include standardizing configuration management, containerization, automating distributed systems
    - Performance tuning, helping developers to fine tune their applications system requirements
    - Maintaining SOC2 complience
    - Incident management

  ]
  #work-heading(
    "DevOps Engineer - II",
    "Fabric",
    "Bengaluru",
    datetime(year: 2020, month: 1, day: 1),
    datetime(year: 2022, month: 10, day: 22),
  )[
    - Deployed production EKS cluster with Istio service mesh for HTTP and gRPC applications
    - Developed reusable terraform modules and owned the maintenance of terraform state of the platform
    - Provisioned disaster recovery environment for reliability excellence
    - Executing multi region environments and corresponding CICD configuration for multi-region deployments
    - Provisioned a unified observability platform with Grafana and Loki for Lambda applications, reducing average RCA time by 15 mins
    - Creation and maintenance of serverless platform using serverless framework using aws lambda and api gateways
  ]

  #work-heading(
    "DevOps Engineer",
    "Olacabs ANI Technologies Pvt Ltd",
    "Bengaluru",
    datetime(year: 2017, month: 4, day: 1),
    datetime(year: 2020, month: 1, day: 1),
  )[
    - Migrated mesos-marathon platform from AWS to Azure as part of Microsoft partnership using Terraform and Chef
    - Creation and maintenance of multiple high available ipsec tunnels between aws and azure for iterative microservice migration from aws to azure
    - Establishing a kong api gateway for efficient routing, migration and rate limiting across multiple cloud providers
    - Extended existing mesos-marathon infrastructure to migrate all assets of an acquired company
    - Private DNS cluster management using powerdns and bind
    - Creation and maintenance of observability platform using prometheus, grafana, newrelic, sysdig and hystrix turbine for circuit breakers
    - Developed utilities in python for various platform automations to reduce cost and time spent
  ]

  #work-heading(
    "Sr Software Engineer",
    "Poornam Info Vision Pvt Ltd",
    "Kochi",
    datetime(year: 2014, month: 4, day: 1),
    datetime(year: 2017, month: 4, day: 1),
  )[
    - Installation of various web, application and databases servers on bare metal linux servers from various data centers and aws ec2
    - Monitoring using zabbix and proactive server management
    - Linux server hardening and disaster recovery
    - Onboarding applications from bare-metal to public cloud providers like aws and gcp
  ]
]

#custom-title("Skills")[
  #skills()[
    - *Cloud & Infrastructure:* AWS, Azure, GCP, Kubernetes, EKS, Istio, Terraform, Serverless Framework
    - *Observability:* Prometheus, Grafana, Loki, Newrelic, Sysdig, Zabbix
    - *CI/CD & Automation:* GitHub Actions, Jenkins, Chef, Python, Bash
    - *Networking & Security:* Kong API Gateway, PowerDNS, IPSec, SOC2 compliance, Linux hardening
    - *Editor & Workflow:* Neovim with LSP and custom plugin setup; enthusiastic about AI-augmented developer workflows using tools like GitHub Copilot and Claude to accelerate iteration and improve code quality
  ]
]

#custom-title("Education")[
  #education-heading(
    "Nehru College of Engineering and Research Center", "Thrissur, Kerala",
    "B. Tech", "Computer Science",
    datetime(year: 2009, month: 7, day: 1),
    datetime(year: 2013, month: 4, day: 1)
  )[]

  #education-heading(
    "Matha Nagar Public School", "Ernakulam, Kerala",
    "ISC", "",
    datetime(year: 2009, month: 1, day: 1),
    datetime(year: 2009, month: 1, day: 1)
  )[]

  #education-heading(
    "Matha Nagar Public School", "Ernakulam, Kerala",
    "ICSC", "",
    datetime(year: 2007, month: 1, day: 1),
    datetime(year: 2007, month: 1, day: 1)
  )[]
]
