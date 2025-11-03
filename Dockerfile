# Utilisation de l'image nginx alpine (légère)
FROM nginx:alpine

# Copie du CV HTML dans le répertoire par défaut de nginx
COPY cv-mohamed-essid.html /usr/share/nginx/html/index.html

# Exposition du port 80
EXPOSE 80

# Nginx démarre automatiquement avec l'image
CMD ["nginx", "-g", "daemon off;"]
