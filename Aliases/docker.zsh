# ============================================================
# Docker Aliases - Categorized
# ============================================================

# ---- Shortcuts ----
alias d='docker'                         # Docker shorthand
alias dcom='docker-compose'              # Docker Compose shorthand

# ---- Container Info ----
alias dps='docker ps'                    # List running containers
alias dpsa='docker ps -a'                # List all containers
alias di='docker images'                 # List images
alias dins='docker inspect'              # Low-level info on object
alias dtop='docker top'                  # Running processes in container
alias dstat='docker stats'               # Live resource usage

# ---- Container Execution ----
alias dex='docker exec -it'              # Interactive exec into container
alias dlog='docker logs'                 # Container logs
alias dlogf='docker logs -f'             # Follow container logs
alias dcp='docker cp'                    # Copy files to/from container

# ---- Container Lifecycle ----
alias dr='docker run'                    # Run a container
alias dri='docker run -it'               # Run interactively
alias drd='docker run -d'                # Run in background
alias dstart='docker start'              # Start stopped container
alias dstop='docker stop'                 # Stop running container
alias drestart='docker restart'          # Restart container
alias drm='docker rm'                    # Remove container
alias drmf='docker rm -f'                # Force remove container

# ---- Image Operations ----
alias dbuild='docker build'              # Build image from Dockerfile
alias dbuildx='docker buildx build'      # Build with BuildKit
alias dpull='docker pull'                # Pull image from registry
alias dpush='docker push'                # Push image to registry
alias drmi='docker rmi'                  # Remove image
alias dtag='docker tag'                  # Tag image

# ---- Volume & Network ----
alias dvol='docker volume'               # Manage volumes
alias dvls='docker volume ls'            # List volumes
alias dnet='docker network'              # Manage networks
alias dnetls='docker network ls'         # List networks

# ---- System & Cleanup ----
alias dprune='docker system prune'       # Clean unused data
alias dprunea='docker system prune -a'   # Clean all unused (incl. images)
alias ddf='docker system df'             # Disk usage summary
alias dimgprune='docker image prune'     # Remove unused images
alias dconprune='docker container prune' # Remove stopped containers
alias dvolprune='docker volume prune'    # Remove unused volumes

# ---- Docker Compose ----
alias dcup='docker-compose up -d'        # Start services in background
alias dcupd='docker-compose up'          # Start services (foreground)
alias dcdown='docker-compose down'       # Stop and remove containers
alias dcstop='docker-compose stop'       # Stop services
alias dcrestart='docker-compose restart' # Restart services
alias dcps='docker-compose ps'           # List containers
alias dclog='docker-compose logs -f'     # Follow all service logs
alias dcbuild='docker-compose build'     # Build services
alias dcex='docker-compose exec'         # Execute command in service
alias dcrmf='docker-compose rm -f'       # Force remove containers

# ---- Utility (Batch Operations) ----
alias dstopall='docker stop $(docker ps -q)'           # Stop all containers
alias drmall='docker rm $(docker ps -aq)'              # Remove all containers
alias drmiall='docker rmi $(docker images -q)'         # Remove all images
alias dstopold='docker ps --filter "status=exited" -q | xargs docker rm'  # Remove exited containers