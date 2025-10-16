# Étape 1 : Utiliser l'image officielle Nginx
FROM nginx:alpine

# Étape 2 : Supprimer la page par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Étape 3 : Copier le contenu de ton CV (index.html + image) vers le dossier Nginx
COPY ./ /usr/share/nginx/html/

# Étape 4 : Donner les bonnes permissions
RUN chmod -R 755 /usr/share/nginx/html

# Étape 5 : Exposer le port 80 pour le serveur web
EXPOSE 80

# Étape 6 : Démarrer Nginx au lancement du container
CMD ["nginx", "-g", "daemon off;"]
