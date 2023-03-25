# Domoticz-Renault-Dacia-Plugin
Plugin to connect Renault or Dacia electrical car to Domoticz.

# Prérequis
Installer Renault-api https://renault-api.readthedocs.io/en/latest/

# Installation et configuration
Cloner le dépot dans le repértoire plugins de votre installation Domoticz

Par exemple sous debian :

<code>cd domoticz/plugins
  git clone https://github.com/Kask29/Domoticz-Renault-Dacia-Plugin</code>

Dans Domoticz / Configuration / Matériel --> ajouter le plugin de type Renault / Dacia connect.

Entrez votre adresse email et mot de passe (les mêmes que ceux de votre appli téléphone).

Le account-id peut être trouvé en faisant : <code>renault-api accounts</code>

Le VIN vous est communiqué par le vendeur. Il peut être trouvé via : <code>renault-api vehicles</code>

Une fois ajouter, le plugin va créer seul :
- les Dispositifs nécessaires (ne pas les renommer, ni les mettre en non-utilisé. Pour les masquer, mettez les en $Hidden depuis plan)
- le dzEvent qui permet de programmer la charge pour un jour/heure donné
- la page web qui permet de créer la tâche plannifiée.

La planification n'est valable qu'une seule fois, rien ne vous empêche de créer vos scénarios personnalisée basés sur les dispositifs du plugin.
