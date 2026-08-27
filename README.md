# Galaxy

Thème spatial pour [BetterDiscord](https://betterdiscord.app), conçu pour être **léger** :
le fond est peint une seule fois, il n'y a aucun `backdrop-filter`, et les seules
animations n'utilisent que `transform` et `opacity` — donc composition GPU pure,
sans repaint ni recalcul de layout.

## Aperçu

- Fond d'espace profond : nébuleuses violet / magenta / bleu / cyan et champ d'étoiles.
- Champ d'étoiles secondaire qui dérive lentement, pour un effet de parallaxe.
- Étoiles filantes traversant l'écran en diagonale, environ toutes les 4 secondes.
- Accents violets : salon actif, pilule de sélection, mentions, scrollbars, boutons.

## Installation

1. Télécharger `Galaxy.theme.css`.
2. Le placer dans le dossier des thèmes BetterDiscord :
   - Windows : `%APPDATA%\BetterDiscord\themes`
   - macOS : `~/Library/Application Support/BetterDiscord/themes`
   - Linux : `~/.config/BetterDiscord/themes`
3. Activer **Galaxy** dans *Paramètres → Thèmes*.

## Personnalisation

Tout se règle dans le bloc `1. PALETTE` en haut du fichier.

| Variable | Rôle |
| --- | --- |
| `--gx-nebula-1` … `-4` | Les quatre couleurs des nébuleuses |
| `--gx-accent` | Couleur d'interaction (salon actif, mentions, scrollbars) |
| `--gx-void`, `--gx-deep` | Fond de l'espace |
| `--gx-panel`, `--gx-panel-2` | Opacité des panneaux |
| `--gx-radius` | Arrondi des surfaces |

Fréquence des étoiles filantes : la durée `8s` des animations `gx-shoot-a` /
`gx-shoot-b` en section 8. Plus courte = passages plus fréquents.

Pour tout figer, il suffit de commenter les lignes `animation:` de la section 8.
Le thème respecte également le réglage système « réduire les animations ».

## Notes de performance

Ce qui est volontairement absent, et pourquoi :

- **`backdrop-filter`** — recompose tout ce qui se trouve derrière la surface à
  chaque frame. C'est de loin le poste le plus coûteux dans un thème Discord.
- **`filter` animé** (`hue-rotate`, `drop-shadow`) sur des couches plein écran —
  repaint permanent, même fenêtre inactive.
- **Sélecteurs fourre-tout** (`[class*="container_"]`, `[class*="scroller_"]`) —
  ils matchent des milliers de nœuds à chaque recalcul de style.

## Licence

MIT — voir [LICENSE](LICENSE).
