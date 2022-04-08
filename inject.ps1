# Write-Host "Temas atualmente aplicados:"
# docker exec -it d216130b4c8d bin/bash -c "cd opt/jboss/keycloak/themes ; dir"
# docker exec -it fabe3f657659 bin/bash

Write-Host "Removendo tema antigo..."
docker exec -u 0 -it kc1 bin/bash -c "cd opt/jboss/keycloak/themes ; rm -rf vwfs-theme ; exit"
docker exec -u 0 -it kc2 bin/bash -c "cd opt/jboss/keycloak/themes ; rm -rf vwfs-theme ; exit"

Write-Host "Importando tema novo..."
docker cp themes\. kc1:/opt/jboss/keycloak/themes
docker cp themes\. kc2:/opt/jboss/keycloak/themes

Write-Host "Reiniciando keycloak..."
docker restart kc1
docker restart kc2

Write-Host "Tema importado com sucesso!"

Write-Host "Temas instalados:"
docker exec -it kc2 bin/bash -c "cd opt/jboss/keycloak/themes ; dir ; exit"