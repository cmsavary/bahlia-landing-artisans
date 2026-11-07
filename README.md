# BahliA, site vitrine

Site statique (un seul fichier `index.html`), servi par nginx et déployé automatiquement par Coolify sur **https://bahlia.fr**.

**Mise en ligne automatique :** chaque `git push` sur la branche `main` redéploie le site en 1 à 2 minutes. Rien d'autre à faire.

## Où en est le site

| Élément | État |
|---|---|
| Site, HTTPS, polices hébergées avec le site | en ligne |
| Photos de Céline et de Thierry | en ligne (`photos/celine.jpg`, `photos/thierry.jpg`) |
| 4 démos vidéo (lecteur qui s'ouvre au clic) | en ligne (`videos/`) |
| Boutons « Écrire un mail » (2) | branchés sur l'adresse Gmail de Céline |
| Boutons « Parlons-en » et « Réserver un appel en visio » (3) | branchés sur la page de réservation Google Agenda (appel de 30 min, avec Google Meet) |

## Contenu du dépôt

| Élément | Rôle |
|---|---|
| `index.html` | La page complète (styles et lecteur vidéo inclus) |
| `fonts/` | Les polices (Fredoka, Nunito), hébergées avec le site |
| `photos/` | Photos de Céline et de Thierry |
| `videos/` | 4 vidéos MP4 et leurs images d'aperçu (`-poster.jpg`) |
| `Dockerfile` | Sert à la mise en ligne, ne pas modifier |

Les 4 démos : `appel-manque-sms`, `devis-en-un-message`, `factures-relancees`, `avis-google` (chacune : un `.mp4` et un `-poster.jpg`).

---

## Modifier le site : le plus simple

Demander à Claude Code, dans le dossier du site, avec une phrase claire. Il modifie `index.html`, fait le commit et le push, puis le site est à jour 1 à 2 minutes plus tard.

**Changer un texte**

```text
Dans index.html, remplace « ancien texte » par « nouveau texte ». Ne change rien d'autre. Fais le commit et le push.
```

**Changer l'adresse mail affichée** (2 boutons « Écrire un mail »)

```text
Dans index.html, remplace l'adresse des deux boutons « Écrire un mail » (liens mailto:) par [NOUVELLE ADRESSE]. Ne change rien d'autre. Fais le commit et le push.
```

**Changer le lien de réservation** (3 boutons : « Parlons-en » et les deux « Réserver un appel en visio »)

```text
Dans index.html, remplace le lien Google Agenda des 3 boutons marqués data-reserver par [NOUVEAU LIEN]. Garde target="_blank" rel="noopener". Ne change rien d'autre. Fais le commit et le push.
```

**Changer une photo**

Mets la nouvelle photo carrée (environ 400 x 400 px, moins de 200 Ko) dans `photos/` avec le **même nom** (`celine.jpg` ou `thierry.jpg`) : la page n'a alors pas besoin d'être modifiée.

---

## Remplacer une vidéo de démo

Règles pour que ça se passe bien :
- Même nom de fichier que l'ancienne vidéo (par exemple `videos/avis-google.mp4`) : la page n'a alors pas besoin d'être modifiée.
- Remplacer aussi l'image d'aperçu `videos/avis-google-poster.jpg` (sans sous-titres incrustés).
- Format 16/9 (1280 x 720), H.264, son AAC mono, durée d'environ 20 secondes, poids de 0,5 à 1 Mo si possible.
- Les vidéos sont en cache un mois dans les navigateurs. Si une vidéo remplacée ne change pas à l'écran, utilise un **nouveau nom de fichier** et fais modifier la page en conséquence.

Pour réencoder une vidéo pour le web (ffmpeg) :

```bash
ffmpeg -i nouvelle_video.mp4 -c:v libx264 -crf 24 -preset slow -profile:v high -level 4.0 \
  -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 128k -ac 1 videos/NOM.mp4
```

Envoyer en ligne :

```bash
cd ~/Documents/bahlia-site && git add -A && git commit -m "Remplacement d'une vidéo" && git push
```

## Ajouter une 5ᵉ démo

```text
Dans index.html, ajoute une 5e carte de démo vidéo en copiant le bloc d'une carte existante (celui qui contient un bouton demo-thumb). Remplace data-video, data-poster, data-title, l'image d'aperçu, le titre et la description par : vidéo videos/[NOM].mp4, aperçu videos/[NOM]-poster.jpg, titre « [TITRE] », description « [DESCRIPTION] ». Ne change rien d'autre. Fais le commit et le push.
```

Les fichiers `[NOM].mp4` et `[NOM]-poster.jpg` doivent d'abord être dans `videos/`.

---

## Envoyer une modification soi-même (sans Claude)

1. Ouvre le Terminal. Le dossier du site est `~/Documents/bahlia-site` (à télécharger une seule fois avec `git clone https://github.com/cmsavary/bahlia-landing-artisans.git bahlia-site`).
2. Modifie les fichiers, puis :

```bash
cd ~/Documents/bahlia-site && git add -A && git commit -m "Mise à jour du site" && git push
```

3. Attends 1 à 2 minutes, puis recharge https://bahlia.fr avec `Cmd + Maj + R`.

## Voir si la mise en ligne a réussi

1. Ouvre Coolify, puis le projet **BahliA**, puis l'application.
2. Clique sur **Deployment Logs** : un statut **Success** veut dire que le site est à jour.
3. Si le statut est **Failed**, ouvre la ligne et copie le message d'erreur pour le donner à Claude.

## À ne jamais mettre dans ce dépôt

Le dépôt est **public**. N'y mets jamais de mot de passe, de clé ou de jeton, ni de coordonnées personnelles ou de données clients.
