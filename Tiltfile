k8s_yaml([
    "k8s/auth-db-deployment.yaml",
    "k8s/auth-db-service.yaml",
    "k8s/identity-db-deployment.yaml",
    "k8s/identity-db-service.yaml",
    "k8s/pgadmin-deployment.yaml",
    "k8s/pgadmin-service.yaml",
    "k8s/pm-auth-api-deployment.yaml",
    "k8s/pm-auth-api-service.yaml",
    "k8s/pm-identity-api-deployment.yaml",
    "k8s/pm-identity-api-service.yaml",
    "k8s/swagger-ui-deployment.yaml",
    "k8s/swagger-ui-service.yaml",
#    "k8s/pm-front-deployment-with-configmap.yaml",
#    "k8s/pm-front-service.yaml",
])

docker_build('pm-auth-api', './pm-auth-api', dockerfile='./pm-auth-api/Dockerfile')
docker_build('pm-identity-api', './pm-identity-api', dockerfile='./pm-identity-api/Dockerfile')
#docker_build(
#    'pm-front',
#    './pm-front',
#    dockerfile='./pm-front/Dockerfile',
#    ignore=['.next']
#)

# Port-forward pour accéder à PgAdmin en local sur http://localhost:8080
k8s_resource('pgadmin', port_forwards='8080:80')

# Port-forward pour accéder à Postgres auth-db en local sur localhost:5432 si besoin
k8s_resource('auth-db', port_forwards=5432)

# Port-forward pour accéder à Postgres identity-db en local sur localhost:5433 si besoin
k8s_resource('identity-db', port_forwards='5433:5432')

# pm-auth-api
k8s_resource('pm-auth-api', port_forwards=5000)

# pm-identity-api
k8s_resource('pm-identity-api', port_forwards='5001:5000')

# swagger-ui
#k8s_resource('swagger-ui', port_forwards=8081)
k8s_resource('swagger-ui', port_forwards='8081:8080')

# pm-front
#k8s_resource('pm-front', port_forwards=3000)
#local_resource(
#    'pm-front-deps',
#    cmd='npm install',
#    deps=['package.json', 'package-lock.json'],
#    ignore=['node_modules']
#)

