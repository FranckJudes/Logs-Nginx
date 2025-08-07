# Analyseur de Logs Nginx

Ce projet contient des scripts shell pour analyser les fichiers de logs d'accès Nginx et extraire des statistiques utiles.

## Fonctionnalités

Les scripts analysent les logs Nginx et fournissent les informations suivantes :

- Top 5 des adresses IP avec le plus de requêtes
- Top 5 des chemins les plus demandés
- Top 5 des codes d'état de réponse
- Top 5 des agents utilisateurs

## Scripts disponibles

### 1. analyze_logs.sh

Ce script utilise principalement la commande `awk` pour extraire et analyser les données des logs.

**Utilisation :**
```bash
./analyze_logs.sh <fichier_log_nginx>
```

