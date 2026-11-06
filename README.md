# BahliA, site vitrine

Site statique (un seul fichier `index.html`), servi par nginx et déployé automatiquement par Coolify sur **https://bahlia.fr**.

**Mise en ligne automatique :** chaque `git push` sur la branche `main` redéploie le site en 1 à 2 minutes. Rien d'autre à faire.

## Contenu du dépôt

| Élément | Rôle |
|---|---|
| `index.html` | La page complète |
| `fonts/` | Les polices (hébergées avec le site) |
| `photos/` | Photos de Céline et de Thierry (vide pour l'instant) |
| `videos/` | Vidéos de démo en MP4 (vide pour l'instant) |
| `Dockerfile` | Sert à la mise en ligne, ne pas modifier |

## Ce qui reste à remplacer dans `index.html`

| Quoi | Où le trouver dans le fichier | Nombre |
|---|---|---|
| Lien de réservation | boutons marqués `data-reserver`, à remplacer `href="#contact"` | 3 |
| Adresse mail | boutons marqués `data-ecrire`, remplacer `contact@bahlia.fr` | 3 |
| Photos | cercles « Photo de Céline » et « Photo de Thierry » | 2 |
| Vidéos | cartes « Démo vidéo à venir » (format 16/9) | 4 |

---

## Ajouter les photos (pas à pas)

**Avant de commencer**
- Format : JPG ou WebP. Photo carrée de préférence, visage centré.
- Taille : environ 400 x 400 pixels, moins de 200 Ko chacune (la page reste rapide).
- Noms de fichiers simples, sans espace ni accent : `celine.jpg`, `thierry.jpg`.

**Étapes**
1. Ouvre le dossier du site sur ton Mac (`~/Documents/bahlia-site`).
2. Glisse `celine.jpg` et `thierry.jpg` dans le dossier **photos**.
3. Remplace les deux cercles dans `index.html` (voir le prompt ci-dessous, ou demande à Claude de le faire).
4. Envoie en ligne : copie cette ligne dans le Terminal.

```bash
cd ~/Documents/bahlia-site && git add -A && git commit -m "Ajout des photos" && git push
```

5. Attends 1 à 2 minutes, puis recharge https://bahlia.fr avec `Cmd + Maj + R`.

**Prompt à copier dans Claude Code**

```text
Dans le dépôt bahlia-site, remplace les deux cercles « Photo de Céline » et « Photo de Thierry » de index.html par les images photos/celine.jpg et photos/thierry.jpg.
Garde exactement le même cercle (104 x 104 px, border-radius 50 %), avec object-fit: cover, et un attribut alt « Photo de Céline » / « Photo de Thierry ».
Ne change rien d'autre dans la page. Vérifie l'affichage sur mobile et ordinateur, puis fais le commit et le push.
```

---

## Ajouter les vidéos (pas à pas)

**Avant de commencer**
- Format : MP4 (codec H.264), format 16/9 (1280 x 720 conseillé).
- Durée : 20 à 45 secondes par démo.
- Poids : **moins de 10 Mo par vidéo** si possible. GitHub refuse les fichiers de plus de 100 Mo, et une vidéo lourde ralentit le site.
- Noms simples, sans espace ni accent : `demo-1.mp4`, `demo-2.mp4`, `demo-3.mp4`, `demo-4.mp4`.
- Pour alléger une vidéo : l'application gratuite HandBrake, préréglage « Fast 720p30 ».
- Une image d'aperçu (optionnelle) : `demo-1.jpg`, mêmes noms, dans `videos/`.

**Étapes**
1. Glisse les vidéos dans le dossier **videos** de `~/Documents/bahlia-site`.
2. Remplace les 4 cartes « Démo vidéo à venir » dans `index.html` (voir le prompt ci-dessous).
3. Envoie en ligne :

```bash
cd ~/Documents/bahlia-site && git add -A && git commit -m "Ajout des vidéos de démo" && git push
```

4. Attends 1 à 2 minutes, puis recharge https://bahlia.fr avec `Cmd + Maj + R`.

**Prompt à copier dans Claude Code**

```text
Dans le dépôt bahlia-site, remplace les 4 cartes « Démo vidéo à venir » de index.html par un lecteur vidéo HTML5 qui lit videos/demo-1.mp4, demo-2.mp4, demo-3.mp4 et demo-4.mp4 (dans l'ordre des cartes).
Chaque vidéo : balise <video> avec controls, playsinline, preload="metadata", même cadre 16/9 et mêmes coins arrondis que le bloc actuel. Pas de lecture automatique avec son.
Ne change rien d'autre dans la page. Vérifie l'affichage sur mobile et ordinateur, puis fais le commit et le push.
```

---

## Remplacer le lien de réservation et l'adresse mail

**Prompt à copier dans Claude Code** (remplace les deux valeurs entre crochets)

```text
Dans le dépôt bahlia-site, dans index.html :
1. sur les 3 boutons marqués data-reserver, remplace href="#contact" par [LIEN DE RÉSERVATION] ;
2. sur les 3 boutons marqués data-ecrire, remplace contact@bahlia.fr par [ADRESSE MAIL].
Ne change rien d'autre. Fais le commit et le push.
```

---

## Voir si la mise en ligne a réussi

1. Ouvre Coolify, puis le projet **BahliA**, puis l'application.
2. Clique sur **Deployment Logs** : un statut **Success** veut dire que le site est à jour.
3. Si le statut est **Failed**, ouvre la ligne et copie le message d'erreur pour le donner à Claude.

## À ne jamais mettre dans ce dépôt

Le dépôt est **public**. N'y mets jamais de mot de passe, de clé ou de jeton, ni de coordonnées personnelles ou de données clients.
