# Mes séances

Petite appli mobile pour noter ses séances de sport.

- **Séance** : date, thème (Jambes, Fesses, Dos, Haut du corps), exercices ou machines, une ligne par série avec répétitions et poids, notes par exercice et pour la séance.
- **Historique** : toutes les séances, filtrables par thème, modifiables. Bouton « Copier pour le tableau » qui exporte au format Date / Thème / Exercice / Séries / Répétitions / Poids / Notes.
- **Progrès** : record, dernier poids, évolution et courbe pour chaque exercice.

## Fonctionnement

L'appli tient dans un seul fichier, `index.html`, sans dépendance à installer.

- Ouverte depuis son lien claude.ai, elle enregistre les séances sur le compte Claude (synchronisées entre appareils).
- Ouverte ailleurs (GitHub Pages, fichier local), elle enregistre les séances dans le navigateur de l'appareil uniquement (`localStorage`). Il n'y a pas de synchronisation entre appareils dans ce cas.

## Mettre en ligne avec GitHub Pages

Settings → Pages → Source : « Deploy from a branch », branche `main`, dossier `/ (root)`.
Sur iPhone, ouvrir l'adresse dans Safari puis Partager → « Sur l'écran d'accueil ».
