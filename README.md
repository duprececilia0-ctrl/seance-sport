# Mes séances

Petite appli mobile pour noter ses séances de sport.

- **Séance** : date, thème (Jambes, Fesses, Dos, Haut du corps), exercices ou machines, une ligne par série avec répétitions et poids, notes par exercice et pour la séance.
- **Historique** : toutes les séances, filtrables par thème, modifiables. Bouton « Copier pour le tableau » qui exporte au format Date / Thème / Exercice / Séries / Répétitions / Poids / Notes.
- **Progrès** : record, dernier poids, évolution et courbe pour chaque exercice.

## Fonctionnement

L'appli tient dans un seul fichier, `index.html`, sans dépendance à installer.

- Ouverte depuis son lien claude.ai, elle enregistre les séances sur le compte Claude (synchronisées entre appareils).
- Ouverte ailleurs (GitHub Pages), elle se connecte à **Supabase** : on crée un compte (e-mail + mot de passe) et les séances sont sauvegardées en ligne. Elles sont d'abord enregistrées sur le téléphone, puis envoyées dès qu'il y a du réseau.

## Supabase

- L'adresse du projet et la clé **publishable** sont en haut du script de `index.html` (`SUPABASE_URL`, `SUPABASE_KEY`). La clé publishable peut être publique ; ne jamais y mettre la clé secrète (`sb_secret_…`).
- La table se crée avec `supabase/schema.sql` (SQL Editor → New query → Run). Chaque compte ne voit que ses propres séances (Row Level Security).
- Authentication → URL Configuration → Site URL : `https://duprececilia0-ctrl.github.io/seance-sport/`

## Mettre en ligne avec GitHub Pages

Settings → Pages → Source : « Deploy from a branch », branche `main`, dossier `/ (root)`.
Sur iPhone, ouvrir l'adresse dans Safari puis Partager → « Sur l'écran d'accueil ».
