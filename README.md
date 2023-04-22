# Domoticz-Renault-Dacia-Plugin
Plugin Domoticz afin d'obtenir les informations et piloter votre véhicule électrique Renault ou Dacia.

## Prérequis
La voiture doit être connectée à internet et disponible via les appli officielles de Renault ou Dacia.

L'API Renault-api https://renault-api.readthedocs.io/en/latest/ doit être installée (la configuration n'est pas nécessaire mais vous permet d'afficher votre account-id et le VIN).

L'API Renault-api doit être dans un répertoire accessible par Domoticz.

## Installation et configuration
### Installation
Cloner le dépôt dans le répertoire <i>plugins</i> de votre installation Domoticz :

Par exemple sous debian :

<code>cd chemin_domoticz/plugins
 git clone https://github.com/Kask29/Domoticz-Renault-Dacia-Plugin</code>

### Configuration
Dans <i>Domoticz / Configuration / Matériel</i> --> ajouter le plugin de type <i>Renault / Dacia connect</i> en le nommant par exemple <b>Spring</b> et rentrez les informations nécessaires à son fonctionnement :
- email du compte Renault ou Dacia
- mot de passe du compte Renault ou Dacia
- Account id (votre account id peut être trouvé via l'API Renault en faisant : <code>renault-api accounts</code>
- VIN (communiqué par le vendeur, sur la carte grise, dans l'appli puis Informations)
- La capacité de la batterie (afin d'estimer les temps de charge)
- La fréquence d'actualisation des dispositifs
![image](https://user-images.githubusercontent.com/98609356/229288772-80d777c3-b704-43a9-9276-8b9153b73661.png)

Une fois ajouté, le plugin va créer seul :
- les Dispositifs nécessaires disponibles dans Interrupteurs et Mesures (ne pas les renommer, ni les supprimer, ni les mettre en non-utilisé. Pour les masquer, mettez les en <i>$Hidden</i> depuis <i>Plan</i>) :
![image](https://user-images.githubusercontent.com/98609356/229288896-56fa6ab4-62df-4cf7-88b2-3865c087a7d9.png)
![image](https://user-images.githubusercontent.com/98609356/229289047-854ee78b-bed2-44c8-a70c-5bc72ca0bf19.png)
- le dzEvent qui permet de programmer la charge (départ et arrêt à un moment donné, avec estimation de la charge obtenue)
- la page web qui permet de créer la tâche planifiée (disponible dans les pages personnalisée, pensez à activer l'onglet)
![image](https://user-images.githubusercontent.com/98609356/229289207-134981ef-6f78-458a-8f0b-422041f6c62a.png)


Toute nouvelle planification annule la planifiation précédente.

La planification n'est valable qu'une seule fois, mais rien ne vous empêche de créer vos scénarios personnalisés (comme habituellement avec Domoticz) basés sur les dispositifs du plugin.
